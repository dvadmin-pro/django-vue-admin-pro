/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-05 01:03:36
 * 联系Qq:1638245306
 * @文件介绍: 角色管理接口
 */
import { request } from '@/api/service'
import XEUtils from 'xe-utils'
export function GetList (query) {
  return request({
    url: '/api/system/role/',
    method: 'get',
    params: query
  })
}

export function GetObj (obj) {
  return request({
    url: '/api/system/role/' + obj.id + '/',
    method: 'get'
  })
}

export function createObj (obj) {
  return request({
    url: '/api/system/role/',
    method: 'post',
    data: obj
  })
}

export function UpdateObj (obj) {
  return request({
    url: '/api/system/role/' + obj.id + '/',
    method: 'put',
    data: obj
  })
}
export function DelObj (id) {
  return request({
    url: '/api/system/role/' + id + '/',
    method: 'delete',
    data: { id }
  })
}

// 获取菜单数据,用于角色授权
export function GetMenuData () {
  return request({
    url: '/api/system/menu/',
    method: 'get',
    params: {}
  }).then(res => {
    // 将列表数据转换为树形数据
    const data = XEUtils.toArrayTree(res.data.data, { parentKey: 'parent' })
    return data
  })
}

// 获取部门数据,用于角色授权
export function GetDeptData () {
  return request({
    url: '/api/system/dept/',
    method: 'get',
    params: {}
  }).then(res => {
    // 将列表数据转换为树形数据
    const data = XEUtils.toArrayTree(res.data.data, { parentKey: 'parent' })
    return data
  })
}
