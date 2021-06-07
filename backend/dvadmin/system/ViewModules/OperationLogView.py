# -*- coding: utf-8 -*-

"""
@author: 李强
@contact: QQ:1206709430
@Created on: 2021/6/8 003 0:30
@Remark: 操作日志管理
"""
from rest_framework import serializers

from dvadmin.plugins.jsonResponse import SuccessResponse
from dvadmin.plugins.serializers import CustomModelSerializer
from dvadmin.plugins.viewset import CustomModelViewSet
from dvadmin.system.ViewModules.MenuView import MenuSerializer
from dvadmin.system.models import OperationLog


class OperationLogSerializer(CustomModelSerializer):
    """
    部门-序列化器
    """
    class Meta:
        model = OperationLog
        fields = "__all__"
        read_only_fields=["id"]


class OperationLogCreateUpdateSerializer(CustomModelSerializer):
    """
    操作日志  创建/更新时的列化器
    """
    class Meta:
        model = OperationLog
        fields = '__all__'


class OperationLogViewSet(CustomModelViewSet):
    """
    操作日志 接口:
    """
    queryset = OperationLog.objects.all()
    serializer_class = OperationLogSerializer
