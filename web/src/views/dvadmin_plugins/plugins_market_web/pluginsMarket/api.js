import { request } from '@/api/service'
export const urlPrefix = '/api/plugins_market/plugins/'

/**
 * 列表查询
 */
export function GetList (query) {
  return request({
    url: urlPrefix,
    method: 'get',
    params: query
  })
}
/**
 * 新增
 */
export function createObj (obj) {
  return request({
    url: urlPrefix,
    method: 'post',
    data: obj
  })
}

/**
 * 修改
 */
export function UpdateObj (obj) {
  return request({
    url: urlPrefix,
    method: 'put',
    data: obj
  })
}
/**
 * 删除
 */
export function DelObj (obj) {
  return request({
    url: urlPrefix,
    method: 'delete',
    data: obj
  })
}
