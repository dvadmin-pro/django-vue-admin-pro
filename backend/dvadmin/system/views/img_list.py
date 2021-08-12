# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/8/9 009 20:48
@Remark:
"""
from dvadmin.system.models import ImgList
from dvadmin.utils.serializers import CustomModelSerializer
from dvadmin.utils.viewset import CustomModelViewSet


class ImgSerializer(CustomModelSerializer):
    class Meta:
        model = ImgList
        exclude = ("url",)

    def create(self,validated_data):
        validated_data['name'] = str(validated_data.get('url'))
        return ImgList.objects.create(**validated_data)


class ImgViewSet(CustomModelViewSet):
    queryset = ImgList.objects.all()
    serializer_class = ImgSerializer
    filter_fields = ['name',]
