# ================================================= #
# ************** mysql数据库 配置  ************** #
# ================================================= #
# 数据库地址
DATABASE_ENGINE = "django.db.backends.mysql"
# 数据库地址 改为自己数据库地址
DATABASE_HOST = "host.docker.internal"
# 数据库端口
DATABASE_PORT = 3306
# 数据库用户名
DATABASE_USER = "root"
# 数据库密码
DATABASE_PASSWORD = "123456"
# 数据库名
DATABASE_NAME = "dvadmin_pro"
# ================================================= #
# ************** 其他 配置  ************** #
# ================================================= #
DEBUG = True  # 线上环境请设置为True
# 是否启用插件，不需要可以设置为False
ENABLE_PLUGINS = False
ALLOWED_HOSTS = ["*"]
