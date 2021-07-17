<!--
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-07-04 00:31:32
 * 联系Qq:1638245306
 * @文件介绍:角色管理
-->
<template>
  <d2-container :class="{ 'page-compact': false }">
    <el-row :gutter="20">
      <el-col :span="4">
        <div>
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
      </el-col>
      <el-col :span="20">
        <div>
          <div>
            <el-button type="primary" @click="submitPermisson">保存</el-button>
          </div>
          <el-tree
            ref="menuTree"
            :data="menuTreeData"
            node-key="id"
            default-expand-all
            :expand-on-click-node="false"
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
      </el-col>
    </el-row>
  </d2-container>
</template>

<script>
import * as api from './api'
import XEUtils from 'xe-utils'
export default {
  name: 'rolePermission',
  data () {
    return {
      filterText: '',
      data: [],
      roleObj: {},
      menuTreeData: [],
      permissionData: []
    }
  },
  watch: {
    filterText (val) {
      this.$refs.tree.filter(val)
    }
  },
  methods: {
    filterNode (value, data) {
      if (!value) return true
      return data.label.indexOf(value) !== -1
    },
    getCrudOptions () {
      // eslint-disable-next-line no-undef
      return crudOptions(this)
    },
    pageRequest (query) {
      return api.GetList(query).then((res) => {
        this.data = res
      })
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
    // 角色树被点击
    nodeClick (data, node, self) {
      this.roleObj = data
      return api.GetMenuData(data).then((res) => {
        res.forEach((x) => {
          x.menuPermission.forEach((a) => {
            // 根据当前角色的permission,对menuPermisson进行勾选处理
            if (data.permission.indexOf(a.id) > -1) {
              this.$set(a, 'checked', true)
            } else {
              this.$set(a, 'checked', false)
            }
          })
        })
        // 将菜单列表转换为树形列表
        this.menuTreeData = XEUtils.toArrayTree(res, { parentKey: 'parent' })
      })
    },
    // 提交修改
    submitPermisson () {
      const menuData = XEUtils.toTreeArray(this.menuTreeData)
      let permissionData = []
      menuData.forEach((x) => {
        const checkedPermission = x.menuPermission.filter((f) => {
          return f.checked
        })
        if (checkedPermission.length > 0) {
          const permission = checkedPermission.map((m) => {
            return m.id
          })
          permissionData = permission
        }
      })
      this.roleObj.permission = permissionData
      return this.updateRequest(this.roleObj).then((res) => {
        this.$message.success('更新成功')
      })
    }
  },
  created () {
    this.pageRequest()
  }
}
</script>

<style lang="scss">
.yxtInput {
  .el-form-item__label {
    color: #49a1ff;
  }
}
</style>
