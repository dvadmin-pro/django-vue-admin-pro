# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/3 003 0:30
@Remark: 菜单按钮管理
"""
from dvadmin.plugins.serializers import CustomModelSerializer
from dvadmin.plugins.viewset import CustomModelViewSet
from dvadmin.system.models import MenuButton


class MenuButtonSerializer(CustomModelSerializer):
    """
    菜单按钮-序列化器
    """
    class Meta:
        model = MenuButton
        fields = "__all__"
        read_only_fields=["id"]


class MenuButtonViewSet(CustomModelViewSet):
    """
    菜单按钮接口:
    """
    queryset = MenuButton.objects.all()
    serializer_class = MenuButtonSerializer
    filter_fields = ['menu']