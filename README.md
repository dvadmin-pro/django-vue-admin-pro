# Django-Vue-Admin-Pro

[![img](https://img.shields.io/badge/license-MIT-blue.svg)](https://gitee.com/liqianglog/django-vue-admin/blob/master/LICENSE)  [![img](https://img.shields.io/badge/python-%3E=3.6.x-green.svg)](https://python.org/)  [![PyPI - Django Version badge](https://img.shields.io/badge/django%20versions-3.2-blue)](https://docs.djangoproject.com/zh-hans/3.2/) [![img](https://img.shields.io/badge/node-%3E%3D%2012.0.0-brightgreen)](https://nodejs.org/zh-cn/) [![img](https://gitee.com/dvadmin/django-vue-admin-pro/badge/star.svg?theme=dark)](https://gitee.com/dvadmin/django-vue-admin-pro)

[预 览](https://demo.django-vue-admin.com) | [官 网文档](https://www.django-vue-admin.com) | [群聊](https://qm.qq.com/cgi-bin/qm/qr?k=fOdnHhC8DJlRHGYSnyhoB8P5rgogA6Vs&jump_from=webapi) | [社区](https://bbs.django-vue-admin.com/) | [Github](https://github.com/liqianglog/django-vue-admin) | [django-vue-admin](https://gitee.com/dvadmin/django-vue-admin-pro/)

## 平台简介

[django-vue-admin-pro](https://gitee.com/dvadmin/django-vue-admin-pro) 是一套全部开源的快速开发平台，毫无保留给个人及企业免费使用。

* 前端采用[D2Admin](https://github.com/d2-projects/d2-admin) 、[Vue](https://cn.vuejs.org/)。
* 后端采用Python语言Django框架。
* 权限认证使用Jwt，支持多终端认证系统。
* 支持加载动态权限菜单，多方式轻松权限控制。
* 特别鸣谢：[D2Admin](https://github.com/d2-projects/d2-admin) 。

## 在线体验

演示地址：[http://demo.pro.django-vue-admin.com](http://demo.pro.django-vue-admin.com) 账号：admin 密码：123456

文档地址：未上线，部署可参考：[http://django-vue-admin.com](http://django-vue-admin.com)

## 交流

- 社区：[戳我](https://bbs.django-vue-admin.com)

- QQ群号：812482043 <a target="_blank" href="https://qm.qq.com/cgi-bin/qm/qr?k=fOdnHhC8DJlRHGYSnyhoB8P5rgogA6Vs&jump_from=webapi"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="django-vue-admin交流01群" title="django-vue-admin交流01群"></a>

- 二维码

  <img src='https://gitee.com/liqianglog/django-vue-admin/raw/master/dvadmin-ui/src/assets/images/qq.jpg' width='200'>

## 源码地址

gitee地址(主推)：[https://gitee.com/dvadmin/django-vue-admin-pro](https://gitee.com/dvadmin/django-vue-admin-pro)

github地址：[https://github.com/dvadmin-pro/django-vue-admin-pro](https://github.com/dvadmin-pro/django-vue-admin-pro)

## 内置功能

1.  部门管理：配置系统组织机构（公司、部门、角色），树结构展现支持数据权限。
2.  菜单管理：配置系统菜单，操作权限，按钮权限标识、后端接口权限等。
3.  角色管理：角色菜单权限分配、数据权限分配、设置角色按部门进行数据范围权限划分。
4.  权限管理：授权角色的权限范围。
5.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
6.  ~~操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。~~
7.  ~~字典管理：对系统中经常使用的一些较为固定的数据进行维护。~~
8.  ~~参数管理：对系统动态配置常用参数。~~
9.  ~~文件管理：管理所有上传的和导出的文件。~~
10.  ~~定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。~~
11.  ~~应用商店：通过插件化自定义需要使用的功能，即插即用~~



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
或使用 daphne :
  daphne -b 0.0.0.0 application.asgi:application

初始账号：superadmin 密码：123456

后端接口文档地址：http://127.0.0.1:8000/swagger
~~~

### docker-compose 运行

~~~shell
待完善
~~~



## 演示图

![image-20210727094356353](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094356353.png)

![image-20210727094510482](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094510482.png)

![image-20210727094547301](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094547301.png)

![image-20210727094600443](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094600443.png)

![image-20210727094620149](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094620149.png)

![image-20210727094632707](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094632707.png)

![image-20210727094647990](https://gitee.com/liqianglog/pic/raw/master/master/image-20210727094647990.png)
