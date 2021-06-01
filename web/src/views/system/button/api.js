/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-05 01:41:34
 * 联系Qq:1638245306
 * @文件介绍: 权限管理接口
 */
import { request } from '@/api/service'

export function GetList(query) {
    return request({
        url: '/api/system/button/',
        method: 'get',
        data: query
    })
}
export function createObj(obj) {
    return request({
        url: '/api/system/button/',
        method: 'post',
        data: obj
    })
}

export function UpdateObj(obj) {
    return request({
        url: '/api/system/button/' + id + '/',
        method: 'put',
        data: obj
    })
}
export function DelObj(id) {
    return request({
        url: '/api/system/button/' + id + '/',
        method: 'delete',
        data: { id }
    })
}

 