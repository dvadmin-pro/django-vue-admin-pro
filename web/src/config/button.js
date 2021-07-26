export const BUTTON_VALUE_TO_COLOR_MAPPING = {
  1: 'success',
  true: 'success',
  0: 'danger',
  false: 'danger',
  Search: 'warning', // 查询
  Update: 'primary', // 编辑
  Create: 'success', // 新增
  Retrieve: 'info', // 单例
  Delete: 'danger' // 删除
}

export function getButtonSettings (objectSettings) {
  return objectSettings.map(item => {
    return {
      label: item.label,
      value: item.value,
      color: BUTTON_VALUE_TO_COLOR_MAPPING[item.value]
    }
  })
}

// 启用 true/ 禁用 false
export const BUTTON_STATUS_BOOL = getButtonSettings([{ label: '启用', value: true }, { label: '禁用', value: false }])

// 启用 1/ 禁用 0
export const BUTTON_STATUS_NUMBER = getButtonSettings([{ label: '启用', value: 1 }, { label: '禁用', value: 0 }])

// 是 1/ 否 0
export const BUTTON_WHETHER_NUMBER = getButtonSettings([{ label: '是', value: 1 }, { label: '否', value: 0 }])
