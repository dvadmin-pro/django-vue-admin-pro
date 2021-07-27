/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-07-27 01:04:24
 * 联系Qq:1638245306
 * @文件介绍: 菜单获取
 */
import { uniqueId } from 'lodash'
import { request } from '@/api/service'
import XEUtils from 'xe-utils'
import store from '@/store/index'
import router from '@/router'
import { frameInRoutes } from '@/router/routes'
const _import = require('@/libs/util.import.' + process.env.NODE_ENV)
/**
 * @description 给菜单数据补充上 path 字段
 * @description https://github.com/d2-projects/d2-admin/issues/209
 * @param {Array} menu 原始的菜单数据
 */
function supplementPath (menu) {
  return menu.map(e => ({
    ...e,
    path: e.path || uniqueId('d2-menu-empty-'),
    ...e.children ? {
      children: supplementPath(e.children)
    } : {}
  }))
}

export const menuHeader = supplementPath([])

// export const menuHeader = supplementPath([
//     { path: '/index', title: '首页', icon: 'home' },
//     {
//         title: '页面',
//         icon: 'folder-o',
//         children: [
//             { path: '/page1', title: '页面 1' },
//             { path: '/page2', title: '页面 2' },
//             { path: '/page3', title: '页面 3' }
//         ]
//     }
// ])

export const menuAside = supplementPath([])
// export const menuAside = supplementPath([
//     { path: '/index', title: '首页', icon: 'home' },
//     {
//         title: '系统管理',
//         icon: 'folder-o',
//         children: [
//             // { path: '/page1', title: '页面 1' },
//             // { path: '/page2', title: '页面 2' },
//             // { path: '/page3', title: '页面 3' },
//             { path: '/menu', title: '菜单' },
//             { path: '/user', title: '用户' },
//             { path: '/button', title: '按钮' },
//             { path: '/role', title: '角色' },
//             { path: '/dept', title: '部门' },
//             { path: '/rolePermission', title: '角色权限' },
//             {
//                 title: '日志管理', children: [
//                     { path: '/operationLog', title: '操作日志' },
//                 ]
//             },
//         ]
//     }
// ])

// 请求路由,封装为动态路由和菜单设置
export const getMenu = function (self) {
  return request({
    url: '/api/system/web_router/',
    method: 'get',
    params: {}
  }).then((res) => {
    // 设置动态路由
    const menuData = res.data.data
    sessionStorage.setItem('menuData', JSON.stringify(menuData))
    for (const item of menuData) {
      if (item.path !== '' && item.parent !== null && item.component) {
        const obj = {
          path: item.path,
          name: item.component_name,
          component: _import(item.component),
          meta: {
            title: item.name,
            auth: true
          }
        }
        frameInRoutes[0].children.push(obj)
        if (item.path.substring(0, 1) !== '/') {
          item.path = '/' + item.path
        }
      } else {
        delete item.path
      }
    }

    // 将列表数据转换为树形数据
    const data = XEUtils.toArrayTree(menuData, {
      parentKey: 'parent',
      strict: true
    })
    const menu = [
      { path: '/index', title: '首页', icon: 'home' },
      ...data
    ]
    let menu_data = supplementPath(menu)
    sessionStorage.setItem("frameInRoutes", JSON.stringify(frameInRoutes))
    return { router: frameInRoutes, menu: menu_data }
  })
}


/**
 * 加载缓存中的菜单,防止F5刷新时404
 */
export const loadMenu = function () {
  let routers = sessionStorage.getItem("frameInRoutes")
  if (routers) {
    routers = JSON.parse(routers)
  } else {
    routers = []
  }

  return routers

  // router.addRoutes(routers)
}
