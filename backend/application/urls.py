"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
import json
import os

from django.urls import path, include, re_path
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import permissions
from rest_framework_simplejwt.views import (
    TokenRefreshView,
)

from application.settings import BASE_DIR
from conf.swagger import CustomOpenAPISchemaGenerator
from dvadmin.system.views.login import LoginView, CaptchaView

yamlPath = os.path.join(BASE_DIR, "plugins", "config.json")
from drf_yasg.renderers import SwaggerUIRenderer, OpenAPIRenderer
schema_view = get_schema_view(
    openapi.Info(
        title="Snippets API",
        default_version='v1',
        description="Test description",
        terms_of_service="https://www.google.com/policies/terms/",
        contact=openapi.Contact(email="contact@snippets.local"),
        license=openapi.License(name="BSD License"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
    generator_class = CustomOpenAPISchemaGenerator,

)

urlpatterns = [
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    path('', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path(r'redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    path('api/system/', include('dvadmin.system.urls')),
    path('api/login/', LoginView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    re_path(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    path('api/captcha/', CaptchaView.as_view()),
]


# ================================================= #
# ******************** 路由导入 ******************** #
# ================================================= #
# 找出模块里所有的类名
def get_classes(arg):
    import inspect
    clsmembers = inspect.getmembers(arg, inspect.isclass)
    for (name, _) in clsmembers:
        obj = getattr(arg, name)
        if hasattr(obj, "url_prefix"):
            return name
    return ""


with open(yamlPath, 'r', encoding='utf-8') as doc:
    plugins_dict = json.load(doc)
    # 进行排序
    plugins_dict = dict(sorted(plugins_dict.items(), key=lambda x: x[1]['priority'], reverse=True))
    for plugins_name, plugins_values in plugins_dict.items():
        # 校验插件是否
        if plugins_values.get('enable', None):
            exec(f"""
# 获取 url_prefix 前缀
from plugins.{plugins_name} import apps

app_config = get_classes(apps)
if not app_config:
    url_prefix = ""
else:
    url_prefix = getattr(getattr(apps, app_config), "url_prefix")
    if url_prefix:
        url_prefix = url_prefix[0] + '/'
# 注册路由
try:
    url = [
        re_path(r'api/' + url_prefix, include('plugins.{plugins_name}.urls')),
    ]
    urlpatterns += url
    print(f"【{plugins_values.get('name', None)}】路由导入成功")
except Exception as e:
    pass
""")
