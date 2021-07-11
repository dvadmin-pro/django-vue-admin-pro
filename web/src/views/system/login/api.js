/*
 * @创建文件时间: 2021-06-02 10:33:33
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-09 11:25:12
 * 联系Qq:1638245306
 * @文件介绍: 登录的接口
 */

import { request } from '@/api/service'

export function SYS_USER_LOGIN (data) {
  return request({
    url: '/api/token/',
    method: 'post',
    data
  })
}
