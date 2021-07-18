<!--
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-07-17 19:27:37
 * 联系Qq:1638245306
 * @文件介绍:角色管理
-->
<template>
  <d2-container :class="{ 'page-compact': false }">
    <SplitPane :min-percent="20" :default-percent="20" split="vertical">
      <template slot="paneL">
        <div style="margin: 10px">
          <div class="yxt-flex-between">
            <div>
              <el-tag>
                当前选择:{{ roleObj.name ? roleObj.name : "无" }}
              </el-tag>
            </div>
            <div>
              <el-button type="primary" size="mini" @click="submitPermisson"
                >保存</el-button
              >
            </div>
          </div>
          <el-input placeholder="输入关键字进行过滤" v-model="filterText">
          </el-input>
          <el-tree
            class="filter-tree"
            :data="data"
            :props="{ label: 'name' }"
            default-expand-all
            :filter-node-method="filterNode"
            @node-click="nodeClick"
            ref="tree"
          >
          </el-tree>
        </div>
      </template>
      <template slot="paneR">
        <SplitPane split="horizontal">
          <template slot="paneL">
            <div style="margin: 10px">
              <div>
                <div style="margin-bottom: 20px">
                  <div class="yxt-flex-align-center">
                    <div class="yxt-divider"></div>
                    <span>数据授权</span>
                  </div>
                </div>
                <el-row>
                  <el-col :span="6">
                    <el-select
                      v-model="roleObj.data_range"
                      @change="dataScopeSelectChange"
                    >
                      <el-option
                        v-for="item in dataScopeOptions"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value"
                      ></el-option>
                    </el-select>
                  </el-col>
                  <el-col :span="18">
                    <div v-show="roleObj.data_range == 4">
                      <el-tree
                        class="tree-border"
                        :data="deptOptions"
                        show-checkbox
                        default-expand-all
                        ref="dept"
                        node-key="id"
                        :check-strictly="true"
                        :props="{ label: 'name' }"
                      ></el-tree>
                    </div>
                  </el-col>
                </el-row>
              </div>
            </div>
          </template>
          <template slot="paneR">
            <div style="margin: 10px">
              <div>
                <div style="margin-bottom: 20px">
                  <div class="yxt-flex-align-center">
                    <div class="yxt-divider"></div>
                    <span>菜单授权</span>
                  </div>
                </div>
                <el-tree
                  ref="menuTree"
                  :data="menuTreeData"
                  node-key="id"
                  default-expand-all
                  show-checkbox
                  :expand-on-click-node="false"
                  :default-checked-keys="menuCheckedKeys"
                  :check-on-click-node="true"
                  :check-strictly="true"
                >
                  <span class="custom-tree-node" slot-scope="{ node, data }">
                    <div class="yxt-flex-between">
                      <div style="margin-right: 50px">{{ data.name }}</div>
                      <div>
                        <el-checkbox
                          v-for="(item, index) in data.menuPermission"
                          :key="index"
                          v-model="item.checked"
                          >{{ item.name }}</el-checkbox
                        >
                      </div>
                    </div>
                  </span>
                </el-tree>
              </div>
            </div>
          </template>
        </SplitPane>
      </template>
    </SplitPane>
  </d2-container>
</template>

<script>
import * as api from "./api";
import XEUtils from "xe-utils";
import Vue from "vue";
import SplitPane from "vue-splitpane";
import log from "@/libs/util.log";

Vue.component("SplitPane", SplitPane);
export default {
  name: "rolePermission",
  data() {
    return {
      filterText: "",
      data: [],
      roleObj: {
        name: null,
        data_range: null,
      },
      menuTreeData: [],
      permissionData: [],
      menuCheckedKeys: [], //菜单默认选中的节点
      deptOptions: [],
      dataScopeOptions: [
        {
          value: 0,
          label: "仅本人数据权限",
        },
        {
          value: 1,
          label: "本部门数据权限",
        },
        {
          value: 2,
          label: "本部门及以下数据权限",
        },
        {
          value: 3,
          label: "全部数据权限",
        },
        {
          value: 4,
          label: "自定数据权限",
        },
      ],
    };
  },
  watch: {
    filterText(val) {
      this.$refs.tree.filter(val);
    },
  },
  methods: {
    filterNode(value, data) {
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    getCrudOptions() {
      // eslint-disable-next-line no-undef
      return crudOptions(this);
    },
    pageRequest(query) {
      return api.GetList(query).then((res) => {
        this.data = res;
      });
    },
    addRequest(row) {
      return api.createObj(row);
    },
    updateRequest(row) {
      return api.UpdateObj(row);
    },
    delRequest(row) {
      return api.DelObj(row.id);
    },
    // 获取部门数据
    getDeptData() {
      api.GetDeptData().then((res) => {
        const data = XEUtils.toArrayTree(res, {
          parentKey: "parent",
        });
        this.deptOptions = data;
      });
    },
    // 角色树被点击
    nodeClick(data, node, self) {
      this.roleObj = data;
      this.getDeptData();
      this.menuCheckedKeys = data.menu; //加载已勾选的菜单
      return api.GetMenuData(data).then((res) => {
        res.forEach((x) => {
          // 根据当前角色的permission,对menuPermisson进行勾选处理
          x.menuPermission.forEach((a) => {
            if (data.permission.indexOf(a.id) > -1) {
              this.$set(a, "checked", true);
            } else {
              this.$set(a, "checked", false);
            }
          });
        });

        // 将菜单列表转换为树形列表
        this.menuTreeData = XEUtils.toArrayTree(res, { parentKey: "parent" });
      });
    },
    // 所有勾选菜单节点数据
    getMenuAllCheckedKeys() {
      // 目前被选中的菜单节点
      const checkedKeys = this.$refs.menuTree.getCheckedKeys();
      // 半选中的菜单节点
      const halfCheckedKeys = this.$refs.menuTree.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys;
    },
    // 所有自定义权限时,勾选的部门节点数据
    getDeptAllCheckedKeys() {
      // 目前被选中的部门节点
      const checkedKeys = this.$refs.dept.getCheckedKeys();
      // 半选中的部门节点
      const halfCheckedKeys = this.$refs.dept.getHalfCheckedKeys();
      checkedKeys.unshift.apply(checkedKeys, halfCheckedKeys);
      return checkedKeys;
    },
    // 提交修改
    submitPermisson() {
      this.roleObj.menu = this.getMenuAllCheckedKeys(); //获取选中的菜单
      this.roleObj.dept = this.getDeptAllCheckedKeys(); //获取选中的部门
      const menuData = XEUtils.toTreeArray(this.menuTreeData);
      let permissionData = [];
      menuData.forEach((x) => {
        const checkedPermission = x.menuPermission.filter((f) => {
          return f.checked;
        });
        if (checkedPermission.length > 0) {
          const permission = checkedPermission.map((m) => {
            return m.id;
          });
          permissionData = permission;
        }
      });
      this.roleObj.permission = permissionData;
      return this.updateRequest(this.roleObj).then((res) => {
        this.$message.success("更新成功");
      });
    },
    /** 选择角色权限范围触发 */
    dataScopeSelectChange(value) {
      if (value !== 4) {
        // this.$refs.dept.setCheckedKeys([]);
      }
    },
  },
  created() {
    this.pageRequest();
  },
};
</script>

<style lang="scss">
.yxtInput {
  .el-form-item__label {
    color: #49a1ff;
  }
}
</style>
