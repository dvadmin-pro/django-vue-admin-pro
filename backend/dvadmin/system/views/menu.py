# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/1 001 22:38
@Remark: 菜单模块
"""
from rest_framework import serializers

from dvadmin.system.models import Menu, MenuButton, Button
from dvadmin.utils.jsonResponse import SuccessResponse
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet


class MenuSerializer(CustomModelSerializer):
    """
    菜单表的简单序列化器
    """
    menuPermission = serializers.SerializerMethodField(read_only=True)

    def get_menuPermission(self, instance):
        queryset = MenuButton.objects.filter(menu=instance.id).values_list('name', flat=True)
        if queryset:
            return queryset
        else:
            return None

    class Meta:
        model = Menu
        fields = "__all__"
        read_only_fields = ["id"]


class MenuCreateSerializer(CustomModelSerializer):
    """
    菜单表的创建序列化器
    """
    name = serializers.CharField(required=False)

    class Meta:
        model = Menu
        fields = "__all__"
        read_only_fields = ["id"]


class MenuTreeSerializer(CustomModelSerializer):
    """
    菜单表的树形序列化器
    """
    children = serializers.SerializerMethodField(read_only=True)
    menuPermission = serializers.SerializerMethodField(read_only=True)

    def get_children(self, instance):
        queryset = Menu.objects.filter(parent=instance.id).filter(status=1)
        if queryset:
            serializer = MenuTreeSerializer(queryset, many=True)
            return serializer.data
        else:
            return None

    def get_menuPermission(self, instance):
        queryset = MenuButton.objects.filter(menu=instance.id).values_list('name', flat=True)
        if queryset:
            return queryset
        else:
            return None

    class Meta:
        model = Menu
        fields = "__all__"
        read_only_fields = ["id"]


class WebRouterSerializer(CustomModelSerializer):
    """
    前端菜单路由的简单序列化器
    """
    path = serializers.CharField(source="web_path")
    title = serializers.CharField(source="name")
    menuPermission = serializers.SerializerMethodField(read_only=True)

    def get_menuPermission(self, instance):
        # 判断是否是超级管理员
        if self.request.user.is_superuser:
            return Button.objects.values_list('value', flat=True)
        else:
            # 根据当前角色获取权限按钮id集合
            permissionIds = self.request.user.role.values_list('permission', flat=True)
            queryset = MenuButton.objects.filter(id__in=permissionIds).values_list('value', flat=True)
            if queryset:
                return queryset
            else:
                return None

    class Meta:
        model = Menu
        fields = "__all__"
        read_only_fields = ["id"]


class MenuViewSet(CustomModelViewSet):
    """
    菜单接口:
    """
    queryset = Menu.objects.all()
    serializer_class = MenuSerializer
    create_serializer_class = MenuCreateSerializer
    update_serializer_class = MenuCreateSerializer
    filter_fields = ['name', 'status']
    search_fields = ['name', 'status']
    permission_classes = []

    def menu_tree(self, request):
        """用于菜单添加修改中获取父级菜单"""
        queryset = Menu.objects.filter(parent=None)
        serializer = MenuTreeSerializer(queryset, many=True)
        return SuccessResponse(data=serializer.data, msg="获取成功")

    def web_router(self, request):
        """用于前端获取当前角色的路由"""
        user = request.user
        if user.is_superuser:
            queryset = Menu.objects.all()
        else:
            menuIds = user.role.values_list('menu__id', flat=True)
            queryset = Menu.objects.filter(id__in=menuIds)
        serializer = WebRouterSerializer(queryset, many=True, request=request)
        return SuccessResponse(data=serializer.data, msg="获取成功")
