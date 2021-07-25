# Django-Vue-Admin-Pro

[![img](https://img.shields.io/badge/license-MIT-blue.svg)](https://gitee.com/liqianglog/django-vue-admin/blob/master/LICENSE)  [![img](https://img.shields.io/badge/python-%3E=3.6.x-green.svg)](https://python.org/)  [![PyPI - Django Version badge](https://img.shields.io/badge/django%20versions-2.2-blue)](https://docs.djangoproject.com/zh-hans/2.2/) [![img](https://img.shields.io/badge/node-%3E%3D%2012.0.0-brightgreen)](https://nodejs.org/zh-cn/) [![img](https://gitee.com/liqianglog/django-vue-admin/badge/star.svg?theme=dark)](https://gitee.com/liqianglog/django-vue-admin)

[预 览](https://demo.django-vue-admin.com) | [官 网文档](https://www.django-vue-admin.com) | [群聊](https://qm.qq.com/cgi-bin/qm/qr?k=fOdnHhC8DJlRHGYSnyhoB8P5rgogA6Vs&jump_from=webapi) | [社区](https://bbs.django-vue-admin.com/) | [Github](https://github.com/liqianglog/django-vue-admin)

## 平台简介

[django-vue-admin-pro](https://gitee.com/dvadmin/django-vue-admin-pro) 是一套全部开源的快速开发平台，毫无保留给个人及企业免费使用。

* 前端采用[D2Admin](https://github.com/d2-projects/d2-admin) 、[Vue](https://cn.vuejs.org/)。
* 后端采用Python语言Django框架。
* 权限认证使用Jwt，支持多终端认证系统。
* 支持加载动态权限菜单，多方式轻松权限控制。
* 特别鸣谢：<u>[Gin-Vue-Admin](https://www.gin-vue-admin.com/)</u>，[D2Admin](https://github.com/d2-projects/d2-admin) ，[Vue-Element-Admin](https://github.com/PanJiaChen/vue-element-admin)。

## 交流

- 社区：[戳我](https://bbs.django-vue-admin.com)

- QQ群号：812482043 <a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=fOdnHhC8DJlRHGYSnyhoB8P5rgogA6Vs&jump_from=webapi"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="django-vue-admin交流01群" title="django-vue-admin交流01群"></a>

- 二维码

  <img src='https://gitee.com/liqianglog/django-vue-admin/raw/master/dvadmin-ui/src/assets/images/qq.jpg' width='200'>

## 源码地址

gitee地址(主推)：[https://gitee.com/dvadmin/django-vue-admin-pro](https://gitee.com/liqianglog/django-vue-admin)

github地址：[https://github.com/dvadmin-pro/django-vue-admin-pro](https://github.com/liqianglog/django-vue-admin)

## 内置功能

##### 后期版本 [版本功能说明](https://gitee.com/liqianglog/django-vue-admin/wikis/releaseNote?sort_id=3615540)

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、角色），树结构展现支持数据权限。
3.  角色授权：授权角色的权限范围。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识、后端接口权限等。
5.  角色管理：角色菜单权限分配、数据权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  文件管理：管理所有上传的和导出的文件。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
11.  登录日志：系统登录日志记录查询包含登录异常。
12.  在线用户：当前系统中活跃用户状态监控、用户强退功能。
14.  定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
15.  在线构建器：拖动表单元素生成相应的HTML代码。
14.  应用商店：通过插件化自定义需要使用的功能，即插即用

## 在线体验

演示地址：[http://dvadmin.django.icu/#/rolePermisson](http://dvadmin.django.icu/#/rolePermisson) 账号：admin 密码：123456

文档地址：[http://django-vue-admin.com](http://django-vue-admin.com)

## 前端

### 	开发

```bash
# 克隆项目
git clone https://gitee.com/dvadmin/django-vue-admin-pro.git

# 进入项目目录
cd web

# 安装依赖
npm install --registry=https://registry.npm.taobao.org

# 启动服务
npm run dev

# 浏览器访问 http://localhost:8080
# .env.development 文件中可配置启动端口等参数
```

### 	发布

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```

## 后端

~~~bash
1. 进入项目目录 cd backend
2. 在项目根目录中，复制 ./conf/env.example.py 文件为一份新的到 ./conf 文件夹下，并重命名为 env.py

3. 在 env.py 中配置数据库信息
	mysql数据库版本建议：8.0
	mysql数据库字符集：utf8mb4
	
4. 安装依赖环境
	pip3 install -r requirements.txt
5. 执行迁移命令：
	python3 manage.py makemigrations
	python3 manage.py migrate
6. 初始化数据
	python3 manage.py init
7. 启动项目
	python3 manage.py runserver 127.0.0.1:8000

定时任务启动命令：
	celery -A application  worker -B --loglevel=info
注：
	Windows 运行celery 需要安装 pip install eventlet
	celery -A application  worker -P eventlet --loglevel=info

初始账号：admin 密码：123456

后端接口文档地址：http://127.0.0.1:8000/docs/
~~~

### docker-compose 运行

~~~shell
待完善
~~~



## 演示图


```

```

