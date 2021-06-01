/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-05 15:55:29
 * 联系Qq:1638245306
 * @文件介绍: 角色管理接口
 */
import { request } from '@/api/service'
import XEUtils from 'xe-utils'
export function GetList(query) {
    return request({
        url: '/api/system/role/',
        method: 'get',
        params: query
    }).then(res => {
        return res.data.data
    })
}

export function GetObj(obj) {
    return request({
        url: '/api/system/role/' + obj.id + '/',
        method: 'get'
    })
}

export function createObj(obj) {
    return request({
        url: '/api/system/role/',
        method: 'post',
        data: obj
    })
}

export function UpdateObj(obj) {
    return request({
        url: '/api/system/role/' + obj.id + '/',
        method: 'put',
        data: obj
    })
}
export function DelObj(id) {
    return request({
        url: '/api/system/role/' + id + '/',
        method: 'delete',
        data: { id }
    })
}

//通过角色id,获取菜单数据
export function GetMenuData(obj) {
    return request({
        url: '/api/system/roleIdToMenu/' + obj.id + '/',
        method: 'get',
        params: {}
    }).then(res => {
        //将列表数据转换为树形数据
        // let data = XEUtils.toArrayTree(res.data.data, { parentKey: 'parent' })
        let data = res.data.data
        return data
    })
}

