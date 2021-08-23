import PluginsConfig from './config.json'

export const plugins = function getPlugins() {
  const plugins = {}
  for (var key in PluginsConfig) {
    if (PluginsConfig[key].enable) {
      plugins[key] = PluginsConfig[key]
    }
  }
  return plugins
}



import cronSelector from '@/views/dvadmin_plugins/dvadmin_apscheduler_web/component/index'
export const dvadmin_plugins = function install(Vue, options) {
  //注册组件
  Vue.use(cronSelector)
}

