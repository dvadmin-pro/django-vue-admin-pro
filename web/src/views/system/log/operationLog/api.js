/*
 * @创建文件时间: 2021-06-08 10:40:32
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-09 10:36:20
 * 联系Qq:1638245306
 * @文件介绍: 操作日志
 */
import { request } from '@/api/service'

export function GetList (query) {
  return request({
    url: '/api/system/operation_log/',
    method: 'get',
    params: query
  })
}
export function AddObj (obj) {
  return request({
    url: '/api/system/user/',
    method: 'post',
    data: obj
  })
}

export function UpdateObj (obj) {
  return request({
    url: '/api/system/user/' + obj.id + '/',
    method: 'put',
    data: obj
  })
}
export function DelObj (id) {
  return request({
    url: '/api/system/operation_log/' + id + '/',
    method: 'delete',
    data: { id }
  })
}
export function GetCascadeData () {
  return request({
    url: '/select/cascadeData',
    method: 'get'
  })
}
