# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/6 006 10:30
@Remark: 自定义权限
"""
import re

from rest_framework.permissions import BasePermission


def ValidationApi(reqApi, validApi):
    """
    验证当前用户是否有接口权限
    :param reqApi: 当前请求的接口
    :param validApi: 用于验证的接口
    :return: True或者False
    """
    valid_api = validApi.replace('{id}', '.*?')
    matchObj = re.match(valid_api, reqApi, re.M | re.I)
    if matchObj:
        return True
    else:
        return False


class CustomPermission(BasePermission):
    """自定义权限"""

    def has_permission(self, request, view):
        # 判断是否是超级管理员
        if request.user.is_superuser:
            return True
        else:
            api = request.path  # 当前请求接口
            method = request.method  # 当前请求方法
            methodList = ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS']
            method = methodList.index(method)
            userApiList = request.user.role.values('permission__api', 'permission__method')  # 获取当前用户的角色拥有的所有接口
            for item in userApiList:
                valid = ValidationApi(api, item.get('permission__api'))
                return valid and (method == item.get('permission__method'))
        return True
