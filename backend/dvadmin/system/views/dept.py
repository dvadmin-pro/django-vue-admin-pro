# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/3 003 0:30
@Remark: 角色管理
"""
from rest_framework import serializers

from dvadmin.system.models import Dept
from dvadmin.utils.json_response import SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet


class DeptSerializer(CustomModelSerializer):
    """
    部门-序列化器
    """

    class Meta:
        model = Dept
        fields = "__all__"
        read_only_fields = ["id"]


class DeptCreateUpdateSerializer(CustomModelSerializer):
    """
    部门管理 创建/更新时的列化器
    """

    class Meta:
        model = Dept
        fields = '__all__'


class DeptTreeSerializer(CustomModelSerializer):
    """
    部门表的树形序列化器
    """
    children = serializers.SerializerMethodField(read_only=True)

    def get_children(self, instance):
        queryset = Dept.objects.filter(parent=instance.id).filter(status=1)
        if queryset:
            serializer = DeptTreeSerializer(queryset, many=True)
            return serializer.data
        else:
            return None

    class Meta:
        model = Dept
        fields = "__all__"
        read_only_fields = ["id"]


class DeptViewSet(CustomModelViewSet):
    """
    部门管理接口
    list:查询
    create:新增
    update:修改
    retrieve:单例
    destroy:删除
    """
    queryset = Dept.objects.all()
    serializer_class = DeptSerializer
    extra_filter_backends = []
    permission_classes = []

    def dept_tree(self, request):
        queryset = Dept.objects.exclude(status=0).filter(parent=None)
        serializer = DeptTreeSerializer(queryset, many=True)
        return SuccessResponse(data=serializer.data, msg="获取成功")
