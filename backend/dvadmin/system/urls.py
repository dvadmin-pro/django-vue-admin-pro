# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/1 001 23:05
@Remark: 系统管理的路由文件
"""
from django.urls import path, re_path
from rest_framework import routers

from dvadmin.system.views.button import ButtonViewSet
from dvadmin.system.views.dept import DeptViewSet
from dvadmin.system.views.dictionary import DictionaryViewSet
from dvadmin.system.views.img_list import ImgViewSet
from dvadmin.system.views.menu import MenuViewSet
from dvadmin.system.views.menu_button import MenuButtonViewSet
from dvadmin.system.views.operation_log import OperationLogViewSet
from dvadmin.system.views.role import RoleViewSet
from dvadmin.system.views.user import UserViewSet

system_url = routers.SimpleRouter()
system_url.register(r'menu', MenuViewSet)
system_url.register(r'button', ButtonViewSet)
system_url.register(r'menu_button', MenuButtonViewSet)
system_url.register(r'role', RoleViewSet)
system_url.register(r'dept', DeptViewSet)
system_url.register(r'user', UserViewSet)
system_url.register(r'operation_log', OperationLogViewSet)
system_url.register(r'dictionary',DictionaryViewSet)
system_url.register(r'img',ImgViewSet)



urlpatterns = [
    re_path('menu/menu_tree/', MenuViewSet.as_view({'get': 'menu_tree'})),
    re_path('dept/dept_tree/', DeptViewSet.as_view({'get': 'dept_tree'})),
    re_path('role/role_id_to_menu/(?P<pk>.*?)/', RoleViewSet.as_view({'get': 'roleId_to_menu'})),
    #re_path('role_data/(?P<pk>.*?)/', RoleViewSet.as_view({'get': 'role_data'})),
    re_path('menu/web_router/', MenuViewSet.as_view({'get': 'web_router'})),
    path('user/user_info/',UserViewSet.as_view({'get':'user_info','put':'update_user_info'})),
    re_path('user/change_password/(?P<pk>.*?)/',UserViewSet.as_view({'put':'change_password'})),
    re_path('dictionary/dictionary_tree/', DictionaryViewSet.as_view({'get': 'dictionary_tree'})),


]
urlpatterns += system_url.urls
