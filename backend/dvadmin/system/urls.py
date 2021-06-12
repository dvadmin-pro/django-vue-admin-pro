# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/1 001 23:05
@Remark: 系统管理的路由文件
"""
from django.urls import path, re_path
from rest_framework import routers

from dvadmin.system.ViewModules.DeptView import DeptViewSet
from dvadmin.system.ViewModules.MenuButtonView import MenuButtonViewSet
from dvadmin.system.ViewModules.MenuView import MenuViewSet
from dvadmin.system.ViewModules.ButtonView import ButtonViewSet
from dvadmin.system.ViewModules.OperationLogView import OperationLogViewSet
from dvadmin.system.ViewModules.RoleView import RoleViewSet
from dvadmin.system.ViewModules.UserView import UserViewSet

system_url = routers.SimpleRouter()
system_url.register(r'menu', MenuViewSet)
system_url.register(r'button',ButtonViewSet)
system_url.register(r'menuButton',MenuButtonViewSet)
system_url.register(r'role',RoleViewSet)
system_url.register(r'dept',DeptViewSet)
system_url.register(r'user',UserViewSet)
system_url.register(r'operationLog',OperationLogViewSet)



urlpatterns = [
       path('menuTree/', MenuViewSet.as_view({'get':'menu_tree'})),
       path('deptTree/', DeptViewSet.as_view({'get':'dept_tree'})),
       re_path('roleIdToMenu/(?P<pk>.*?)/', RoleViewSet.as_view({'get':'roleId_to_menu'})),
       path('webRouter/', MenuViewSet.as_view({'get':'web_router'})),

]
urlpatterns += system_url.urls
