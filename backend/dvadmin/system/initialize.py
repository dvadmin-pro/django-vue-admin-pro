# 初始化
import os

import django

# 在environ字典里设置默认Django环境，'xxxx.settings'指Django项目的配置文件
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'application.settings')
django.setup()

from dvadmin.system.models import Dept, Button, Menu, MenuButton, Role, Users


class Initialize:
    def save(self, obj, data: list, name):
        print(f"正在初始化【{name}】")
        for ele in data:
            id = ele.pop('id')
            obj.objects.get_or_create(id=id, defaults=ele)
        print(f"初始化完成【{name}】")

    def init_dept(self):
        """
        初始化部门信息
        """
        creator_id = "456b688c-8ad5-46de-bc2e-d41d8047bd42"
        data = [
            {"id": "cae96ade-7483-4827-bb0d-d2bd63ec1cc4", "name": "财务部门", "sort": 1, "creator_id": creator_id,
             "parent_id": "d2c03bd9-dad0-4262-88ca-c3681d224fc3"},
            {"id": "d2c03bd9-dad0-4262-88ca-c3681d224fc3", "name": "dvadmin团队", "sort": 1, "creator_id": creator_id,
             "parent_id": None},
            {"id": "fd8230ca-67bd-4347-8a9b-57eb19be5d9e", "name": "研发部门", "sort": 2, "creator_id": creator_id,
             "parent_id": "d2c03bd9-dad0-4262-88ca-c3681d224fc3"}
        ]
        self.save(Dept, data, "部门信息")

    def init_button(self):
        """
        初始化权限表标识
        """
        data = [
            {"id": "4547b93a-36b9-410d-987c-3c52a9b51156", "name": "编辑", "value": "Update"},
            {"id": "4a410769-6b0a-4ed3-90f0-b5d89a6f802c", "name": "删除", "value": "Delete"},
            {"id": "644e9c34-e3d6-4518-b795-a603a6e9a137", "name": "单例", "value": "Retrieve"},
            {"id": "80cb145b-5035-4517-a28a-7d59426f73f8", "name": "新增", "value": "Create"},
            {"id": "ccc3f35f-c80c-4929-b8cc-67531698f397", "name": "查询", "value": "Search"},
        ]
        self.save(Button, data, "权限表标识")

    def init_menu(self):
        """
        初始化菜单表
        """
        data = [
            {"id": "151035da-77a3-4a62-b474-fce6824571fb", "name": "按钮管理", "sort": 6, "web_path": "/button",
             "icon": "support", "parent_id": "54f769b0-3dff-416c-8102-e55ec44827cc", "component": "system//button",
             "component_name": "button", "status": 0},
            {"id": "15c9ebc5-d12f-470a-a560-938a7dc57570", "name": "角色管理", "sort": 3, "web_path": "/role",
             "icon": "users", "parent_id": "54f769b0-3dff-416c-8102-e55ec44827cc", "component": "system/role",
             "component_name": "role"},
            {"id": "4236eb70-1558-43a0-9cf2-037230c547f9", "name": "部门管理", "sort": 1, "web_path": "/dept",
             "icon": "university", "parent_id": "54f769b0-3dff-416c-8102-e55ec44827cc", "component": "system/dept",
             "component_name": "dept"},
            {"id": "4ba07859-8b73-4524-a1a6-bbff36d98337", "name": "操作日志", "sort": 1, "web_path": "/operationLog",
             "icon": "gears", "parent_id": "c236fb6b-ddaa-4deb-b79b-16e42d9f347f",
             "component": "system/log/operationLog", "component_name": "operationLog"},
            {"id": "54f769b0-3dff-416c-8102-e55ec44827cc", "name": "系统管理", "sort": 1, "web_path": "",
             "icon": "briefcase", "parent_id": None, "component": None, "component_name": None},
            {"id": "56c3f341-4f46-4b04-9cfc-c8a14701707e", "name": "菜单管理", "sort": 2, "web_path": "/menu",
             "icon": "reorder", "parent_id": "54f769b0-3dff-416c-8102-e55ec44827cc", "component": "system/menu",
             "component_name": "menu"},
            {"id": "5a05450c-cec2-4819-8d54-e0d6f6aac3a6", "name": "用户管理", "sort": 5, "web_path": "/user",
             "icon": "user", "parent_id": "54f769b0-3dff-416c-8102-e55ec44827cc", "component": "system/user",
             "component_name": "user"},
            {"id": "a607e820-36e5-45c0-aabf-85a8e4e2c7ac", "name": "权限管理", "sort": 4, "web_path": "/rolePermisson",
             "icon": "user-plus", "parent_id": "54f769b0-3dff-416c-8102-e55ec44827cc",
             "component": "system/rolePermisson", "component_name": "rolePermisson"},
            {"id": "c236fb6b-ddaa-4deb-b79b-16e42d9f347f", "name": "日志管理", "sort": 1, "web_path": "", "icon": "clock-o",
             "parent_id": None, "component": None, "component_name": None},
        ]
        self.save(Menu, data, "菜单表")

    def init_menu_button(self):
        """
        初始化菜单权限表
        """
        data = [
            {"id": "0209de89-6b9f-4d8a-84d3-ccfc3cc8b4da", "menu_id": "151035da-77a3-4a62-b474-fce6824571fb",
             "name": "编辑", "value": "Update", "api": "/api/system/button/{id}/", "method": 2},
            {"id": "04896a47-0f3a-4e2f-a111-bfe15f9e31c5", "menu_id": "56c3f341-4f46-4b04-9cfc-c8a14701707e",
             "name": "编辑", "value": "Update", "api": "/api/system/menu/{id}/", "method": 2},
            {"id": "0d931efc-2f80-418f-b4a0-5251f0a88f69", "menu_id": "4ba07859-8b73-4524-a1a6-bbff36d98337",
             "name": "新增", "value": "Create", "api": "/api/system/operation_log/", "method": 1},
            {"id": "10610c56-cec2-4774-9468-e1c763e59e70", "menu_id": "4236eb70-1558-43a0-9cf2-037230c547f9",
             "name": "新增", "value": "Create", "api": "/api/system/dept/", "method": 1},
            {"id": "140166e2-471e-455e-9dcd-05cebbbab95d", "menu_id": "15c9ebc5-d12f-470a-a560-938a7dc57570",
             "name": "查询", "value": "Search", "api": "/api/system/role/", "method": 0},
            {"id": "14e7088f-a39b-47ae-bd67-b9bbcabae96b", "menu_id": "5a05450c-cec2-4819-8d54-e0d6f6aac3a6",
             "name": "单例", "value": "Retrieve", "api": "/api/system/user/{id}/", "method": 0},
            {"id": "1b4f27a7-8ab8-4388-ae57-46e29976cf0e", "menu_id": "151035da-77a3-4a62-b474-fce6824571fb",
             "name": "新增", "value": "Create", "api": "/api/system/button/", "method": 1},
            {"id": "2a3d4756-4d51-4129-b3c4-b2c7a00dbb8a", "menu_id": "15c9ebc5-d12f-470a-a560-938a7dc57570",
             "name": "新增", "value": "Create", "api": "/api/system/role/", "method": 1},
            {"id": "37462e31-3cdf-4576-af10-5958f53b1bef", "menu_id": "4ba07859-8b73-4524-a1a6-bbff36d98337",
             "name": "查询", "value": "Search", "api": "/api/system/operation_log/", "method": 0},
            {"id": "3e11db64-b8e8-4558-963b-71d063a7db16", "menu_id": "4236eb70-1558-43a0-9cf2-037230c547f9",
             "name": "编辑", "value": "Update", "api": "/api/system/dept/{id}/", "method": 2},
            {"id": "3fd6ae6c-fd76-4465-b2b6-db672f4bd79e", "menu_id": "15c9ebc5-d12f-470a-a560-938a7dc57570",
             "name": "删除", "value": "Delete", "api": "/api/system/role/{id}/", "method": 3},
            {"id": "42ad6e05-7c84-444f-bcae-09de84f4988b", "menu_id": "56c3f341-4f46-4b04-9cfc-c8a14701707e",
             "name": "查询", "value": "Search", "api": "/api/system/menu/", "method": 0},
            {"id": "43696212-ecba-4e66-8678-33c9bc935c76", "menu_id": "5a05450c-cec2-4819-8d54-e0d6f6aac3a6",
             "name": "查询", "value": "Search", "api": "/api/system/user/", "method": 0},
            {"id": "51085c21-2279-490f-8878-594f059f7616", "menu_id": "151035da-77a3-4a62-b474-fce6824571fb",
             "name": "删除", "value": "Delete", "api": "/api/system/button/{id}/", "method": 3},
            {"id": "6208f412-6bca-4d7b-a5a0-0103b7ba6091", "menu_id": "151035da-77a3-4a62-b474-fce6824571fb",
             "name": "单例", "value": "Retrieve", "api": "/api/system/button/{id}/", "method": 0},
            {"id": "6300774a-d19c-43ad-8102-d7bf341eff33", "menu_id": "4236eb70-1558-43a0-9cf2-037230c547f9",
             "name": "单例", "value": "Retrieve", "api": "/api/system/dept/{id}/", "method": 0},
            {"id": "646e9790-24f5-4606-abc4-0b5eede12f66", "menu_id": "4236eb70-1558-43a0-9cf2-037230c547f9",
             "name": "查询", "value": "Search", "api": "/api/system/dept/", "method": 0},
            {"id": "875bdfeb-0c34-441d-8ee3-bb93c21e17dd", "menu_id": "5a05450c-cec2-4819-8d54-e0d6f6aac3a6",
             "name": "编辑", "value": "Update", "api": "/api/system/user/{id}/", "method": 2},
            {"id": "8ae924bd-576c-4ae1-92eb-b0a98148baae", "menu_id": "56c3f341-4f46-4b04-9cfc-c8a14701707e",
             "name": "删除", "value": "Delete", "api": "/api/system/menu/{id}/", "method": 3},
            {"id": "8b7a0e79-a6ef-4946-87c6-8c042b887e1c", "menu_id": "4ba07859-8b73-4524-a1a6-bbff36d98337",
             "name": "单例", "value": "Retrieve", "api": "/api/system/operation_log/{id}/", "method": 0},
            {"id": "96022ae5-6425-47b9-8f89-01edc33eb2b7", "menu_id": "15c9ebc5-d12f-470a-a560-938a7dc57570",
             "name": "单例", "value": "Retrieve", "api": "/api/system/role/{id}/", "method": 0},
            {"id": "9fc8436a-1996-478f-a155-5de7939a54dc", "menu_id": "5a05450c-cec2-4819-8d54-e0d6f6aac3a6",
             "name": "新增", "value": "Create", "api": "/api/system/user/", "method": 1},
            {"id": "abe5c07f-0cab-4053-ac24-e782792e9d7f", "menu_id": "56c3f341-4f46-4b04-9cfc-c8a14701707e",
             "name": "新增", "value": "Create", "api": "/api/system/menu/", "method": 1},
            {"id": "acfde861-1872-47e2-a1f1-abeda5175b7f", "menu_id": "4ba07859-8b73-4524-a1a6-bbff36d98337",
             "name": "删除", "value": "Delete", "api": "/api/system/operation_log/{id}/", "method": 3},
            {"id": "af60d628-73b1-4c5d-b34e-7c70ab9bd87e", "menu_id": "151035da-77a3-4a62-b474-fce6824571fb",
             "name": "查询", "value": "Search", "api": "/api/system/button/", "method": 0},
            {"id": "b10f7d08-2592-4b54-8557-b5ca864a029a", "menu_id": "4236eb70-1558-43a0-9cf2-037230c547f9",
             "name": "删除", "value": "Delete", "api": "/api/system/dept/{id}/", "method": 3},
            {"id": "bb7de9ee-5fd1-46f5-9849-088c522f49c7", "menu_id": "5a05450c-cec2-4819-8d54-e0d6f6aac3a6",
             "name": "删除", "value": "Delete", "api": "/api/system/user/{id}/", "method": 3},
            {"id": "d22c0176-96e0-48b3-b81e-13443f306af5", "menu_id": "15c9ebc5-d12f-470a-a560-938a7dc57570",
             "name": "编辑", "value": "Update", "api": "/api/system/role/{id}/", "method": 2},
            {"id": "e6b93920-2236-46ec-841b-cff6f63ce788", "menu_id": "4ba07859-8b73-4524-a1a6-bbff36d98337",
             "name": "编辑", "value": "Update", "api": "/api/system/operation_log/{id}/", "method": 2},
            {"id": "fcbe4cec-cc2d-436d-92ba-023f8c9ad31c", "menu_id": "56c3f341-4f46-4b04-9cfc-c8a14701707e",
             "name": "单例", "value": "Retrieve", "api": "/api/system/menu/{id}/", "method": 0},
        ]
        self.save(MenuButton, data, "菜单权限表")

    def init_role(self):
        """
        初始化角色表
        """
        data = [
            {"id": "36001d1a-1b3e-4413-bdfe-b3bc04375f46", "name": "管理员", "key": "admin", "sort": 1, "status": 1,
             "admin": 0, "data_range": 3},
            {"id": "35b58d98-b506-4f93-be79-ed1e109da071", "name": "普通用户", "key": "public", "sort": 2, "status": 1,
             "admin": 1, "data_range": 4},

        ]
        self.save(Role, data, "角色表")

    def init_users(self):
        """
        初始化用户表
        """
        data = [
            {"id": "2457d43b-bb74-4ac6-94ae-454acf1f0160", "password": "管理员", "is_superuser": 0, "is_staff": 0,
             "is_active": 1, "username": "test", "name": "测试"},
            {"id": "456b688c-8ad5-46de-bc2e-d41d8047bd42", "password": "普通用户", "is_superuser": 1, "is_staff": 1,
             "is_active": 1, "username": "superadmin", "name": "超级管理员"},
            {"id": "bcb411ce-13ff-4a2a-8eda-fcdd243a7f76", "password": "普通用户", "is_superuser": 0, "is_staff": 0,
             "is_active": 0, "username": "demo", "name": "demo"},
            {"id": "d1431450-5068-4461-b57e-7862c005a547", "password": "普通用户", "is_superuser": 0, "is_staff": 0,
             "is_active": 1, "username": "admin", "name": "管理员"},
        ]
        self.save(Users, data, "用户表")

    def run(self):
        self.init_dept()
        self.init_button()
        self.init_menu()
        self.init_menu_button()
        self.init_role()
        self.init_users()


def run():
    Initialize().run()
    pass


if __name__ == '__main__':
    run()
