# 城市联动
"""
到乡级 使用方法
1. https://www.npmjs.com/package/china-division 下载数据，把对应的json放入对应目录
2. 修改此文件中对应json名
3. 右击执行此py文件进行初始化
"""
import json
import os

import django
import pypinyin

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
django.setup()
from application.settings import BASE_DIR
from dvadmin.system.models import Area

area_code_list = []


def area_list(code_list, pcode=None, depth=1):
    """
    递归获取所有列表
    """
    for code_dict in code_list:
        code = code_dict.get('code', None)
        name = code_dict.get('name', None)
        children = code_dict.get('children', None)
        pinyin = ''.join([''.join(i) for i in pypinyin.pinyin(name, style=pypinyin.NORMAL)])
        area_code_list.append(
            {
                "name": name,
                "code": code,
                "level": depth,
                "pinyin": pinyin,
                "initials": pinyin[0].upper() if pinyin else "#",
                "pcode_id": pcode,
            }
        )
        if children:
            area_list(code_list=children, pcode=code, depth=depth + 1)


def main():
    with open(os.path.join(BASE_DIR, 'dvadmin', 'system', 'util', 'pca-code.json'), 'r') as load_f:
        code_list = json.load(load_f)
    area_list(code_list)
    if Area.objects.count() == 0:
        Area.objects.bulk_create([Area(**ele) for ele in area_code_list])
    else:
        for ele in area_code_list:
            code = ele.pop("code")
            Area.objects.update_or_create(code=code, defaults=ele)


if __name__ == '__main__':
    main()
