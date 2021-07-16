# # dvadmin 插件
# # ================================================= #
# # ******************** 插件配置 ******************** #
# # ================================================= #
import os

from application.settings import BASE_DIR

for ele in os.listdir(os.path.join(BASE_DIR, "plugins")):
    if not ele.startswith("__") and os.path.isdir(os.path.join(BASE_DIR, "plugins", ele)):
        NAME = ""
        exec("from plugins.dvadmin_tenant import NAME")
        from plugins.dvadmin_tenant.settings import *
        print(f"【{NAME}】导入成功")
