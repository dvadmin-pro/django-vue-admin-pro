# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/6 006 10:30
@Remark: 自定义权限
"""
from django.db.models import Q
from rest_framework.permissions import BasePermission


class CustomPermission(BasePermission):
    """自定义权限"""
    def has_permission(self, request, view):
        api = request.path #当前请求接口
        method = request.method #当前请求方法
        methodList = ['GET','POST','PUT','DELETE','OPTIONS']
        method = methodList.index(method)
        roleList = request.user.role.all() #获取当前用户的角色
        for ietm in roleList:
            permission = ietm.permission.filter(Q(api__iregex=api)&Q(method=method))
            print(23,permission)
            # if permission:
            #     return True
            # else:
            #     return False
        return True
