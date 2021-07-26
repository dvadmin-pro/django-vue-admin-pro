# # dvadmin 插件
# # ================================================= #
# # ******************** 插件配置 ******************** #
# # ================================================= #
import os

from ruamel import yaml

from application.settings import BASE_DIR

yamlPath = os.path.join(BASE_DIR, "plugins", "config.yaml")
with open(yamlPath, 'r', encoding='utf-8') as doc:
    plugins_dict = yaml.load(doc, Loader=yaml.Loader)
    # 进行排序
    plugins_dict = dict(sorted(plugins_dict.items(), key=lambda x: x[1]['priority'], reverse=True))
    for plugins_name, plugins_values in plugins_dict.items():
        # 校验插件是否
        if plugins_values.get('enable', None):
            exec(f"from plugins.{plugins_name}.settings import *")
            print(f"【{plugins_values.get('name', None)}】导入成功")
# for ele in os.listdir(os.path.join(BASE_DIR, "plugins")):
#
#     if not ele.startswith("__") and os.path.isdir(os.path.join(BASE_DIR, "plugins", ele)):
#
#         # try:
#
#
#         NAME = content.get("BASIC", {}).get("name")
#         ENABLE = content.get("BASIC", {}).get("enable")
#         if ENABLE:
#             exec(f"from plugins.{ele}.backend.settings import *")
#
#             print(f"【{NAME}】导入成功")
#     # except Exception as e:
#     #     print(e)
#     #     pass
