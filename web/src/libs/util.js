import cookies from './util.cookies'
import db from './util.db'
import log from './util.log'

const util = {
  cookies,
  db,
  log
}

/**
 * @description 更新标题
 * @param {String} titleText 标题
 */
util.title = function (titleText) {
  const processTitle = process.env.VUE_APP_TITLE || 'D2Admin'
  window.document.title = `${processTitle}${titleText ? ` | ${titleText}` : ''}`
}
/**
 * @description 获取所有的插件配置
 */
util.getPlugins = function () {
  // const fs = require('fs')
  // const path = require('path')
  // const moduleDirs = fs.readdirSync(path.resolve(__dirname, '@/plugins')).filter(moduleDir => {
  //   return fs.statSync(path.resolve(__dirname, '@/plugins', moduleDir)).isDirectory()
  // })
  // const moduleList = moduleDirs.map(moduleDir => {
  //   const moduleConfig = {
  //     dir: moduleDir,
  //     name: moduleDir,
  //     priority: 99,
  //     title: moduleDir,
  //     redirect: null,
  //     icon: null,
  //     gitlabProjectId: '',
  //     is_dynamic_menu: false
  //   }
  //   try {
  //     const moduleExport = require(`../src/modules/${moduleDir}/module`)
  //     moduleConfig.name = moduleExport.name || moduleDir
  //     moduleConfig.priority = moduleExport.priority || 99
  //     moduleConfig.title = moduleExport.title || moduleConfig.name
  //     moduleConfig.redirect = moduleExport.redirect || null
  //     moduleConfig.icon = moduleExport.icon || ''
  //     moduleConfig.gitlabProjectId = moduleExport.gitlabProjectId || ''
  //     moduleConfig.is_dynamic_menu = moduleExport.is_dynamic_menu || false
  //   } catch (e) {
  //     console.log(`缺失/${moduleDir}/module.js`)
  //   }
  //   return moduleConfig
  // })
  // console.log(11, moduleDirs)
}

/**
 * @description 打开新页面
 * @param {String} url 地址
 */
util.open = function (url) {
  var a = document.createElement('a')
  a.setAttribute('href', url)
  a.setAttribute('target', '_blank')
  a.setAttribute('id', 'd2admin-link-temp')
  document.body.appendChild(a)
  a.click()
  document.body.removeChild(document.getElementById('d2admin-link-temp'))
}
/**
 * @description 校验是否为租户模式。租户模式把域名替换成 域名 加端口
 */
util.baseURL = function () {
  var baseURL = process.env.VUE_APP_API
  util.getPlugins()
  var is_public = false
  if (is_public) {
    // document.domain
    var host = baseURL.split('/')[2]
    console.log('host', host)
    var prot = host.split(':')[1] || 80
    host = document.domain + ':' + prot
    baseURL = baseURL.split('/')[0] + '//' + baseURL.split('/')[1] + host + '/' + (baseURL.split('/')[3] || '')
  }
  return baseURL
}

export default util
