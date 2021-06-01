# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/2 002 16:06
@Remark: 自定义异常处理
"""
from django.db import DatabaseError
from django.db.models import ProtectedError
from rest_framework import exceptions
from rest_framework.exceptions import APIException as DRFAPIException, AuthenticationFailed
from rest_framework.views import exception_handler,set_rollback

import json,copy

from dvadmin.plugins.jsonResponse import ErrorResponse
from dvadmin.plugins.validator import CustomValidationError


# def CustomExceptionHandler(exc, context):
#     # Call REST framework's default exception handler first,
#     # to get the standard error response.
#     response = exception_handler(exc, context)
#     # Now add the HTTP status code to the response.
#     if response is not None:
#         print("Exception错误信息",response.status_code,response.data)
#         if str(exc) in "token已过期":
#             response.status_code = 401
#         errorMsg = copy.deepcopy(response.data)
#         response.data.clear()
#         response.data['code'] = response.status_code
#         response.data['data'] = None
#
#         if response.status_code == 400:
#             field =""
#             msg = "发生错误"
#             for key in errorMsg:
#                 field = key
#                 msg =  errorMsg[key][0]
#             response.data['msg'] = field + msg
#
#         elif response.status_code == 401:
#             response.data['msg'] = "登录已过期"
#
#         elif response.status_code == 403:
#             response.data['msg'] = "您没有权限"
#
#         elif response.status_code == 404:
#                 response.data['msg'] = "接口资源未找到"
#
#         elif response.status_code == 405:
#             response.data['msg'] = '请求方法不正确'
#
#         elif response.status_code >= 500:
#             response.data['msg'] = "服务器异常,请联系管理员"
#         response.code = response.status_code
#         response.status_code = response.status_code
#     else:
#         view = context['view']
#         print("Exception数据库错误",isinstance(exc, ProtectedError))
#         if isinstance(exc, ProtectedError) or isinstance(exc, DatabaseError):
#             print('[%s]: %s' % (view, exc))
#             response = ErrorResponse(msg='该条数据与其他数据有相关绑定,无法被删除')
#
#     return response

def CustomExceptionHandler(ex, context):
    """
    统一异常拦截处理
    目的:(1)取消所有的500异常响应,统一响应为标准错误返回
        (2)准确显示错误信息
    :param ex:
    :param context:
    :return:
    """
    msg = ''
    code = 4000

    if isinstance(ex, AuthenticationFailed):
        code = 401
        msg = ex.detail
    elif isinstance(ex, DRFAPIException):
        set_rollback()
        msg = ex.detail
    elif isinstance(ex, exceptions.APIException):
        set_rollback()
        msg = ex.detail
    elif isinstance(ex, ProtectedError):
        set_rollback()
        msg = "删除失败:该条数据与其他数据有相关绑定"
    # elif isinstance(ex, DatabaseError):
    #     set_rollback()
    #     msg = "接口服务器异常,请联系管理员"
    elif isinstance(ex, Exception):

        msg = str(ex)


    # errorMsg = msg
    # for key in errorMsg:
    #     msg = errorMsg[key][0]

    return ErrorResponse(msg=msg, code=code)