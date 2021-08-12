# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/2 002 14:20
@Remark:登录视图
"""

from django.utils.translation import gettext_lazy as _
from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView

from dvadmin.system.models import Users


class LoginSerializer(TokenObtainPairSerializer):
    """
    登录的序列化器:
    重写djangorestframework-simplejwt的序列化器
    """
    class Meta:
        model = Users
        fields = "__all__"
        read_only_fields = ["id"]

    default_error_messages = {
        'no_active_account': _('该账号已被禁用,请联系管理员')
    }

    def validate(self, attrs):
        username = attrs['username']
        password = attrs['password']
        user = Users.objects.filter(username=username).first()
        if user and user.check_password(password):  # check_password() 对明文进行加密,并验证
            data = super().validate(attrs)
            refresh = self.get_token(self.user)

            data['name'] = self.user.name
            data['userId'] = self.user.id
            data['refresh'] = str(refresh)
            data['access'] = str(refresh.access_token)
            result = {
                "code": 2000,
                "msg": "请求成功",
                "data": data
            }
        else:
            result = {
                "code": 4000,
                "msg": "账号/密码不正确",
                "data": None
            }
        return result


class LoginView(TokenObtainPairView):
    """
    登录接口
    """
    serializer_class = LoginSerializer
    permission_classes = []
