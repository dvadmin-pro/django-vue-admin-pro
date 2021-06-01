# -*- coding: utf-8 -*-

"""
@author: 猿小天
@contact: QQ:1638245306
@Created on: 2021/6/1 001 22:57
@Remark: 自定义视图集
"""
from rest_framework.viewsets import ModelViewSet

from dvadmin.plugins.filters import DataLevelPermissionsFilter
from dvadmin.plugins.jsonResponse import SuccessResponse
from dvadmin.plugins.permission import CustomPermission


class CustomModelViewSet(ModelViewSet):
    """
    自定义的ModelViewSet:
    统一标准的返回格式;新增,查询,修改可使用不同序列化器
    (1)ORM性能优化, 尽可能使用values_queryset形式
    (2)create_serializer_class 新增时,使用的序列化器
    (3)update_serializer_class 修改时,使用的序列化器
    """
    values_queryset = None
    ordering_fields = '__all__'
    create_serializer_class = None
    update_serializer_class = None
    permission_classes  = [CustomPermission]
    filter_fields = ()
    search_fields = ()
    filter_backends  = [DataLevelPermissionsFilter]

    def get_queryset(self):
        if getattr(self, 'values_queryset', None):
            return self.values_queryset
        return super().get_queryset()

    def create(self, request, *args, **kwargs):
        if self.create_serializer_class:
            serializer = self.create_serializer_class(data=request.data,request=request)
        else:
            serializer = self.get_serializer(data=request.data,request=request)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return SuccessResponse(data=serializer.data, msg="新增成功")

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True,request=request)
            return self.get_paginated_response(serializer.data)
            # result = self.get_paginated_response(serializer.data)
            # print(51,result.data)
            # return JsonResponse(code=2000,msg="获取成功", data=result.data)
        serializer = self.get_serializer(queryset, many=True,request=request)
        return SuccessResponse(data=serializer.data, msg="获取成功")

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return SuccessResponse(data=serializer.data, msg="获取成功")

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        if self.update_serializer_class:
            serializer = self.update_serializer_class(instance, data=request.data, partial=partial,request=request)
        else:
            serializer = self.get_serializer(instance,data=request.data,request=request)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, '_prefetched_objects_cache', None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return SuccessResponse(data=serializer.data, msg="更新成功")

    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return SuccessResponse(data=[], msg="删除成功")