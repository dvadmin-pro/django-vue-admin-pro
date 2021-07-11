# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/3 003 0:30
@Remark: 用户管理
"""
from django.contrib.auth.hashers import make_password
from rest_framework import serializers

from dvadmin.system.models import Users
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.validator import CustomUniqueValidator
from dvadmin.utils.viewset import CustomModelViewSet


class UserSerializer(CustomModelSerializer):
    """
    用户管理-序列化器
    """

    class Meta:
        model = Users
        read_only_fields = ["id"]
        exclude = ['password']
        extra_kwargs = {
            'post': {'required': False},
        }


class UserCreateSerializer(CustomModelSerializer):
    """
    用户新增-序列化器
    """
    username = serializers.CharField(max_length=50,
                                     validators=[CustomUniqueValidator(queryset=Users.objects.all(), message="账号必须唯一")])
    password = serializers.CharField(required=False, default=make_password("123456"))

    def save(self, **kwargs):
        data = super().save(**kwargs)
        data.post.set(self.initial_data.get('post', []))
        return data

    class Meta:
        model = Users
        fields = "__all__"
        read_only_fields = ["id"]
        extra_kwargs = {
            'post': {'required': False},
        }


class UserUpdateSerializer(CustomModelSerializer):
    """
    用户修改-序列化器
    """
    username = serializers.CharField(max_length=50,
                                     validators=[CustomUniqueValidator(queryset=Users.objects.all(), message="账号必须唯一")])
    password = serializers.CharField(required=False, allow_blank=True)

    def save(self, **kwargs):
        data = super().save(**kwargs)
        data.post.set(self.initial_data.get('post', []))
        return data

    class Meta:
        model = Users
        read_only_fields = ["id"]
        fields = "__all__"
        extra_kwargs = {
            'post': {'required': False, 'read_only': True},
        }


class UserViewSet(CustomModelViewSet):
    """
    用户接口:
    """
    queryset = Users.objects.exclude(is_superuser=1).all()
    serializer_class = UserSerializer
    create_serializer_class = UserCreateSerializer
    update_serializer_class = UserUpdateSerializer
    permission_classes = []
