/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-06 18:41:37
 * 联系Qq:1638245306
 * @文件介绍: 
 */
import { uniqueId } from 'lodash'

/**
 * @description 给菜单数据补充上 path 字段
 * @description https://github.com/d2-projects/d2-admin/issues/209
 * @param {Array} menu 原始的菜单数据
 */
function supplementPath(menu) {
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

export const menuAside = supplementPath([
    { path: '/index', title: '首页', icon: 'home' },
    {
        title: '系统管理',
        icon: 'folder-o',
        children: [
            // { path: '/page1', title: '页面 1' },
            // { path: '/page2', title: '页面 2' },
            // { path: '/page3', title: '页面 3' },
            { path: '/menu', title: '菜单' },
            { path: '/user', title: '用户' },
            { path: '/button', title: '按钮' },
            { path: '/role', title: '角色' },
            { path: '/dept', title: '部门' },
            { path: '/rolePermisson', title: '角色权限' },

        ]
    }
])