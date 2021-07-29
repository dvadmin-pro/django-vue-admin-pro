import PluginsConfig from '../../../backend/plugins/config.json'

export function getPlugins () {
  const plugins = {}
  for (var key in PluginsConfig) {
    if (PluginsConfig[key].enable && PluginsConfig[key].type === 'web') {
      plugins[key] = PluginsConfig[key]
    }
  }
  return plugins
}

export default getPlugins()
