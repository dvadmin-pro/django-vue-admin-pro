# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/1 001 22:47
@Remark: 自定义序列化器
"""
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from rest_framework.fields import empty
from rest_framework.request import Request

from dvadmin.system.models import Users


class CustomModelSerializer(ModelSerializer):
    """
    增强DRF的ModelSerializer,可自动更新模型的审计字段记录
    (1)self.request能获取到rest_framework.request.Request对象
    """
    # 修改人的审计字段名称, 默认modifier, 继承使用时可自定义覆盖
    modifier_field_id = 'modifier'
    modifier_name = serializers.SerializerMethodField(read_only=True)
    def get_modifier_name(self, instance):
        queryset = Users.objects.filter(id=instance.modifier).values_list('name',flat=True).first()
        if queryset:
            return queryset
        return None
    # 创建人的审计字段名称, 默认creator, 继承使用时可自定义覆盖
    creator_field_id = 'creator'
    creator_name = serializers.SlugRelatedField(slug_field="name", source="creator", read_only=True)
    # 数据所属部门字段
    dept_belong_id_field_name = 'dept_belong_id'
    # 添加默认时间返回格式
    create_datetime = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)
    update_datetime = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False)



    def __init__(self, instance=None, data=empty, request=None, **kwargs):
        super().__init__(instance, data, **kwargs)
        self.request: Request = request or self.context.get('request', None)


    def save(self, **kwargs):
        return super().save(**kwargs)

    def create(self, validated_data):
        if self.request:
            if self.modifier_field_id in self.fields.fields:
                validated_data[self.modifier_field_id] = self.get_request_userId()
            if self.creator_field_id in self.fields.fields:
                validated_data[self.creator_field_id] = self.request.user
            if self.dept_belong_id_field_name in self.fields.fields:
                validated_data[self.dept_belong_id_field_name] = getattr(self.request.user, 'dept_id', None)
        return super().create(validated_data)

    def update(self, instance, validated_data):
        if self.request:
            if hasattr(self.instance, self.modifier_field_id):
                self.instance.modifier = self.get_request_username()
        return super().update(instance, validated_data)

    def get_request_username(self):
        if getattr(self.request, 'user', None):
            return getattr(self.request.user, 'username', None)
        return None

    def get_request_name(self):
        if getattr(self.request, 'user', None):
            return getattr(self.request.user, 'name', None)
        return None

    def get_request_userId(self):
        if getattr(self.request, 'user', None):
            return getattr(self.request.user, 'id', None)
        return None
