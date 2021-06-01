/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-06 10:14:14
 * 联系Qq:1638245306
 * @文件介绍: 用户接口
 */
import { request } from '@/api/service'

export function GetList(query) {
  return request({
    url: '/api/system/user',
    method: 'get',
    params: query
  })
}
export function AddObj(obj) {
  return request({
    url: '/api/system/user/',
    method: 'post',
    data: obj
  })
}

export function UpdateObj(obj) {
  return request({
    url: '/api/system/user/' + obj.id + '/',
    method: 'put',
    data: obj
  })
}
export function DelObj(id) {
  return request({
    url: '/api/system/user/' + id + '/',
    method: 'delete',
    data: { id }
  })
}
export function GetCascadeData() {
  return request({
    url: '/select/cascadeData',
    method: 'get'
  })
}
