import PluginsConfig from './config.json'

import cronSelector from '@/views/dvadmin_plugins/dvadmin_apscheduler_web/component/index'

export const plugins = function getPlugins () {
  const plugins = {}
  for (var key in PluginsConfig) {
    if (PluginsConfig[key].enable) {
      plugins[key] = PluginsConfig[key]
    }
  }
  return plugins
}
export const dvadminPlugins = function install (Vue, options) {
  // 注册组件
  Vue.use(cronSelector)
}
