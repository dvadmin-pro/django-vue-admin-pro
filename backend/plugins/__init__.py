# # dvadmin 插件
# # ================================================= #
# # ******************** 插件配置 ******************** #
# # ================================================= #
import json
import os

from application.settings import BASE_DIR

yamlPath = os.path.join(BASE_DIR, "plugins", "config.json")
with open(yamlPath, 'r', encoding='utf-8') as doc:
    plugins_dict = json.load(doc)
    # 进行排序
    plugins_dict = dict(sorted(plugins_dict.items(), key=lambda x: x[1]['priority'], reverse=True))
    for plugins_name, plugins_values in plugins_dict.items():
        # 校验插件是否
        if plugins_values.get('enable', None):
            exec(f"from plugins.{plugins_name}.settings import *")
            print(f"【{plugins_values.get('name', None)}】导入成功")
