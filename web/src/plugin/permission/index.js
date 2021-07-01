import store from '@/store'

import util from '@/libs/util'
import Vue from 'vue'
import permissionDirective from './directive/permission'
import router from '@/router'


function isInited() {
  if (!isEnabled) {
    console.warn('PM is disabled')
    return true
  }
  return store.getters['permission/inited']
}

const isEnabled = process.env.VUE_APP_PM_ENABLED === 'true'
// 开启权限模块
if (isEnabled) {
  // 注册v-permission指令, 用于控制按钮权限
  Vue.use(permissionDirective)

}

export default {
  isEnabled,
  isInited
}
