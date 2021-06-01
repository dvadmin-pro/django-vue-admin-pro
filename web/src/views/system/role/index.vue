<!--
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-05 01:23:01
 * 联系Qq:1638245306
 * @文件介绍:角色管理
-->
<template>
  <d2-container  :class="{'page-compact':crud.pageOptions.compact}">
<!--    <template slot="header">测试页面1</template>-->
    <d2-crud-x
      ref="d2Crud"
      v-bind="_crudProps"
      v-on="_crudListeners"
      @createMenuPermission="createMenuPermission"
      @createDataPermission="createDataPermission"
    >
      <div slot="header">
        <crud-search ref="search" :options="crud.searchOptions" @submit="handleSearch"  />
        <el-button-group>
          <el-button size="small" type="primary" @click="addRow"><i class="el-icon-plus"/> 新增</el-button>
        </el-button-group>
        <crud-toolbar :search.sync="crud.searchOptions.show"
                      :compact.sync="crud.pageOptions.compact"
                      :columns="crud.columns"
                      @refresh="doRefresh()"
                      @columns-filter-changed="handleColumnsFilterChanged"/>

      </div>
    </d2-crud-x>

    <!-- 弹出框:菜单授权 -->
    <el-dialog title="菜单授权" :visible.sync="dialogMenuVisible" width="500px" append-to-body :close-on-click-modal="false" :destroy-on-close="true">
      <el-form :model="form" label-width="80px">
        <el-form-item label="角色名称">
          <el-input v-model="form.name" :disabled="true" />
        </el-form-item>
        <el-form-item label="权限字符">
          <el-input v-model="form.key" :disabled="true" />
        </el-form-item>
        <el-form-item label="菜单权限">
          <el-checkbox v-model="menuExpand" @change="handleCheckedTreeExpand($event, 'menu')">展开/折叠</el-checkbox>
          <el-checkbox v-model="menuNodeAll" @change="handleCheckedTreeNodeAll($event, 'menu')">全选/全不选</el-checkbox>
          <el-checkbox v-model="form.menuCheckStrictly" @change="handleCheckedTreeConnect($event, 'menu')">父子联动</el-checkbox>
          <el-tree
            class="tree-border"
            :data="menuOptions"
            show-checkbox
            ref="menu"
            node-key="id"
            :check-strictly="!form.menuCheckStrictly"
            empty-text="加载中，请稍后"
            :props="{ label:'name' }"
          ></el-tree>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitMenu">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

     <!-- 分配角色数据权限对话框 -->
    <el-dialog title="数据授权" :visible.sync="openDataScope" width="500px" append-to-body :close-on-click-modal="false" :destroy-on-close="true">
      <el-form :model="form" label-width="80px">
        <el-form-item label="角色名称">
          <el-input v-model="form.name" :disabled="true" />
        </el-form-item>
        <el-form-item label="权限字符">
          <el-input v-model="form.key" :disabled="true" />
        </el-form-item>
        <el-form-item label="权限范围">
          <el-select v-model="form.data_range" @change="dataScopeSelectChange">
            <el-option
              v-for="item in dataScopeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="数据权限" v-show="form.data_range == 4">
          <el-checkbox v-model="deptExpand" @change="handleCheckedTreeExpand($event, 'dept')">展开/折叠</el-checkbox>
          <el-checkbox v-model="deptNodeAll" @change="handleCheckedTreeNodeAll($event, 'dept')">全选/全不选</el-checkbox>
          <el-checkbox v-model="form.deptCheckStrictly" @change="handleCheckedTreeConnect($event, 'dept')">父子联动</el-checkbox>
          <el-tree
            class="tree-border"
            :data="deptOptions"
            show-checkbox
            default-expand-all
            ref="dept"
            node-key="id"
            :check-strictly="!form.deptCheckStrictly"
            empty-text="加载中，请稍后"
            :props="{ label:'name' }"
          ></el-tree>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitDataScope">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </d2-container>
</template>

<script>
import * as api from './api'
import { crudOptions } from './crud'
import { d2CrudPlus } from 'd2-crud-plus'
export default {
  name: 'role',
  mixins: [d2CrudPlus.crud],
  data () {
    return {
      dialogMenuVisible:false,
      menuExpand: false,
      menuNodeAll: false,
      form:{ },
      menuOptions:[],
      openDataScope:false,
      deptExpand:false,
      deptNodeAll:false,
      deptOptions:[],
      dataScopeOptions:[
        {
          value: 0,
          label: "仅本人数据权限"
        },
         {
          value: 1,
          label: "本部门数据权限"
        },
        {
          value: 2,
          label: "本部门及以下数据权限"
        },
        {
          value: 3,
          label: "全部数据权限"
        },
        {
          value:4,
          label: "自定数据权限"
        }
      ]
    }
  },
  methods: {
    getCrudOptions () {
      return crudOptions(this)
    },
    pageRequest (query) {
      return api.GetList(query)
    },
    addRequest (row) {
      return api.createObj(row)
    },
    updateRequest (row) {
      return api.UpdateObj(row)
    },
    delRequest (row) {
      return api.DelObj(row.id)
    },
    //菜单授权
     createMenuPermission (scope) {
       this.dialogMenuVisible = true
       this.form = scope.row
       api.GetObj(scope.row).then(res=>{
         this.$refs.menu.setCheckedKeys(res.data.data.menu);
       })
    },
    // 树权限（展开/折叠）
    handleCheckedTreeExpand(value, type) {
      if (type == 'menu') {
        let treeList = this.menuOptions;
        for (let i = 0; i < treeList.length; i++) {
          this.$refs.menu.store.nodesMap[treeList[i].id].expanded = value;
        }
      } else if (type == 'dept') {
        let treeList = this.deptOptions;
        for (let i = 0; i < treeList.length; i++) {
          this.$refs.dept.store.nodesMap[treeList[i].id].expanded = value;
        }
      }
    },
    // 树权限（全选/全不选）
    handleCheckedTreeNodeAll(value, type) {
      if (type == 'menu') {
        this.$refs.menu.setCheckedNodes(value ? this.menuOptions: []);
      } else if (type == 'dept') {
        this.$refs.dept.setCheckedNodes(value ? this.deptOptions: []);
      }
    },
    // 树权限（父子联动）
    handleCheckedTreeConnect(value, type) {
      if (type == 'menu') {
        this.form.menuCheckStrictly = value ? true: false;
      } else if (type == 'dept') {
        this.form.deptCheckStrictly = value ? true: false;
      }
    },
    // 取消按钮
    cancel() {
       this.dialogMenuVisible = false
       this.openDataScope = false
      this.reset();
    },
    reset() {
      if (this.$refs.menu != undefined) {
        this.$refs.menu.setCheckedKeys([]);
      }
      this.menuExpand = false,
      this.menuNodeAll = false,
      this.deptExpand = true,
      this.deptNodeAll = false,
      this.form = {
        id:null,
        menu: [],
        dept: [],
        menuCheckStrictly: true,
        deptCheckStrictly: true,
      };
       
    },
    //获取所有的菜单数据
    getMenuData(){
      api.GetMenuData().then(res=>{
         this.menuOptions = res
       })
    },
     // 所有菜单节点数据
    getMenuAllCheckedKeys() {
      // 目前被选中的菜单节点
      let checkedKeys = this.$refs.menu.getCheckedKeys();
      // 半选中的菜单节点
      let halfCheckedKeys = this.$refs.menu.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys;
    },
    //提交修改后的菜单授权
    submitMenu(){
      this.form.menu = this.getMenuAllCheckedKeys();
      return api.UpdateObj(this.form).then(res=>{
        this.dialogMenuVisible = false
        this.$message.success(res.msg)
      })
    },
    //获取部门数据
    getDeptData(){
      api.GetDeptData().then(res=>{
         this.deptOptions = res
       })
    },
    //数据权限授权
    createDataPermission(scope){
      this.openDataScope = true
      this.form = scope.row
       api.GetObj(scope.row).then(res=>{
         this.$refs.dept.setCheckedKeys(res.data.data.dept);
       })
    },
    /** 选择角色权限范围触发 */
    dataScopeSelectChange(value) {
      if(value !== 4) {
        this.$refs.dept.setCheckedKeys([]);
      }
    },
    // 所有部门节点数据
    getDeptAllCheckedKeys() {
      // 目前被选中的部门节点
      let checkedKeys = this.$refs.dept.getCheckedKeys();
      // 半选中的部门节点
      let halfCheckedKeys = this.$refs.dept.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys;
    },
    submitDataScope(){
      this.form.dept = this.getDeptAllCheckedKeys();
      return api.UpdateObj(this.form).then(res=>{
        this.openDataScope = false
        this.$message.success(res.msg)
      })
    }
  },
  created(){
    this.getMenuData()
    this.getDeptData()
  }
}
</script>

<style lang="scss">
.yxtInput{
  .el-form-item__label{
    color: #49a1ff;
  }
}
</style>
