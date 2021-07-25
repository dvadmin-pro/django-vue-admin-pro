# # dvadmin 插件
# # ================================================= #
# # ******************** 插件配置 ******************** #
# # ================================================= #
import os

from ruamel import yaml

from application.settings import BASE_DIR

for ele in os.listdir(os.path.join(BASE_DIR, "plugins")):
    if not ele.startswith("__") and os.path.isdir(os.path.join(BASE_DIR, "plugins", ele)):

        # try:
            yamlPath = os.path.join(BASE_DIR, "plugins", ele, "config.yaml")
            with open(yamlPath, 'r', encoding='utf-8') as doc:
                content = yaml.load(doc, Loader=yaml.Loader)
            NAME = content.get("BASIC", {}).get("name")
            ENABLE = content.get("BASIC", {}).get("enable")
            if ENABLE:
                exec(f"from plugins.{ele}.backend.settings import *")

                print(f"【{NAME}】导入成功")
        # except Exception as e:
        #     print(e)
        #     pass
