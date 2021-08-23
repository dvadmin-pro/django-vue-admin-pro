import PluginsConfig from './config.json'

export function getPlugins () {
  const plugins = {}
  for (var key in PluginsConfig) {
    if (PluginsConfig[key].enable) {
      plugins[key] = PluginsConfig[key]
    }
  }
  return plugins
}

export const plugins = getPlugins()

export const dvadminPlugins = async function install (Vue, options) {
  for (var key in plugins) {
    try {
      const Module = await import('@/views/dvadmin_plugins/' + key + '/component/index')
      // 注册组件
      if (Module.default) {
        Vue.use(Module.default)
      }
    } catch (exception) {

    }
  }
}
