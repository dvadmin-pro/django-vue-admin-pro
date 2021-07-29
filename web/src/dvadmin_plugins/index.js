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

export default getPlugins()
