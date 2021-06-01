# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/3 003 0:30
@Remark: 按钮权限管理
"""
from dvadmin.plugins.serializers import CustomModelSerializer
from dvadmin.plugins.viewset import CustomModelViewSet
from dvadmin.system.models import   Button


class ButtonSerializer(CustomModelSerializer):
    """
    按钮权限-序列化器
    """
    class Meta:
        model = Button
        fields = "__all__"
        read_only_fields=["id"]


class ButtonViewSet(CustomModelViewSet):
    """
    按钮权限接口:
    """
    queryset = Button.objects.all()
    serializer_class = ButtonSerializer