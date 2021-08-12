import { request } from '@/api/service'
import { BUTTON_STATUS_NUMBER, BUTTON_WHETHER_NUMBER, BUTTON_VALUE_TO_COLOR_MAPPING } from '@/config/button'
export const crudOptions = (vm) => {
  return {
    pagination: false,
    pageOptions: {
      compact: true
    },
    options: {
      tableType: 'vxe-table',
      rowKey: true, // 必须设置，true or false
      rowId: 'id',
      height: '100%', // 表格高度100%, 使用toolbar必须设置
      highlightCurrentRow: false,
      treeConfig: { // 树形数据配置
        children: 'children',
        hasChild: 'hasChildren'
      }
    },
    rowHandle: {
      view: {
        disabled () {
          return !vm.hasPermissions('Retrieve')
        }
      },
      edit: {
        thin: true,
        text: '编辑',
        disabled () {
          return !vm.hasPermissions('Update')
        }
      },
      remove: {
        thin: true,
        text: '删除',
        disabled () {
          return !vm.hasPermissions('Delete')
        }
      },
      width: 350,
      custom: [{
        show (index, row) {
          if (row.web_path) {
            return true
          }
          return false
        },
        disabled () {
          return !vm.hasPermissions('Update')
        },
        text: ' 按钮配置',
        type: 'warning',
        size: 'small',
        emit: 'createPermission'
      }]

    },
    indexRow: { // 或者直接传true,不显示title，不居中
      title: '序号',
      align: 'center',
      width: 80
    },

    viewOptions: {
      componentType: 'form'
    },
    formOptions: {
      defaultSpan: 24 // 默认的表单 span
    },
    columns: [
      {
        title: '关键词',
        key: 'search',
        show: false,
        disabled: true,
        search: {
          disabled: false,
          component: {
            props: {
              clearable: true
            }
          }
        },
        form: {
          disabled: true,
          component: {
            props: {
              clearable: true
            }
          }
        },
        view: { // 查看对话框组件的单独配置
          disabled: true
        }
      },
      {
        title: 'ID',
        key: 'id',
        show: false,
        width: 60,
        form: {
          disabled: true
        }
      },
      {
        title: '父级菜单',
        key: 'parent',
        show: false,
        search: {
          disabled: true
        },
        type: 'cascader',
        dict: {
          url: '/api/system/menu/menu_tree/',
          cache: false,
          value: 'id', // 数据字典中value字段的属性名
          label: 'name', // 数据字典中label字段的属性名
          children: 'children', // 数据字典中children字段的属性名
          getData: (url, dict) => { // 配置此参数会覆盖全局的getRemoteDictFunc
            return request({ url: url }).then(ret => {
              return [{ id: null, name: '根节点', children: ret.data.data }]
            })
          }

        },
        form: {
          component: {
            span: 12,
            props: {
              elProps: {
                clearable: true,
                showAllLevels: false, // 仅显示最后一级
                props: {
                  checkStrictly: true, // 可以不需要选到最后一级
                  emitPath: false,
                  clearable: true
                }
              }
            }
          }
        }
      },
      {
        title: '菜单名称',
        key: 'name',
        sortable: true,
        treeNode: true, // 设置为树形列
        search: {
          disabled: false,
          component: {
            props: {
              clearable: true
            }
          }
        },
        width: 180,
        type: 'input',
        form: {
          rules: [ // 表单校验规则
            { required: true, message: '必填项' }
          ],
          component: {
            span: 12,
            props: {
              clearable: true
            }

          },
          itemProps: {
            class: { yxtInput: true }
          }

        }
      },
      {
        title: '图标',
        key: 'icon',
        width: 60,
        type: 'icon-selector',
        form: {
          component: {
            span: 12

          }
        }
      },
      {
        title: '排序',
        key: 'sort',
        width: 60,
        type: 'number',
        form: {
          value: 1,
          component: {
            span: 12
          }
        }
      },
      {
        title: '外链接',
        key: 'is_link',
        width: 70,
        type: 'radio',
        dict: {
          data: BUTTON_WHETHER_NUMBER
        },
        form: {
          value: 0,
          component: {
            span: 12
          }
        }
      },
      {
        title: '路由地址',
        key: 'web_path',
        width: 130,
        form: {
          component: {
            span: 12,
            props: {
              clearable: true
            }
          },
          helper: {
            render (h) {
              return (< el-alert title="浏览器中url的地址,请以/开头" type="warning" />
              )
            }
          }
        }
      },
      {
        title: '组件名称',
        key: 'component_name',
        width: 130,
        form: {
          component: {
            span: 12,
            props: {
              clearable: true
            }
          },
          helper: {
            render (h) {
              return (< el-alert title="xx.vue文件中的name" type="warning" />
              )
            }
          }
        }
      },
      {
        title: '组件地址',
        key: 'component',
        width: 130,
        type: 'select',
        dict: {
          data: vm.searchFiles()
        },
        form: {
          component: {
            span: 12,
            props: {
              clearable: true,
              filterable: true // 可过滤选择项
            }
          },
          helper: {
            render (h) {
              return (< el-alert title="src/views下的文件夹地址" type="warning" />
              )
            }
          }
        }
      },
      {
        title: '权限',
        key: 'menuPermission',
        width: 165,
        type: 'select',
        form: {
          disabled: true,
          component: {
            span: 12,
            elProps: { // el-select的配置项，https://element.eleme.cn/#/zh-CN/component/select
              filterable: true,
              multiple: true,
              clearable: true
            }
          }
        },
        dict: {
          url: '/api/system/button/',
          label: 'name',
          value: 'name',
          getData: (url, dict) => {
            return request({ url: url }).then(ret => {
              return ret.data.data.map(item => {
                return Object.assign(item, { color: BUTTON_VALUE_TO_COLOR_MAPPING[item.value] || 'auto' })
              })
            })
          }
        }
      },
      {
        title: '缓存',
        key: 'cache',
        search: {
          disabled: false
        },
        width: 50,
        type: 'radio',
        dict: {
          data: BUTTON_WHETHER_NUMBER
        },
        form: {
          value: 0,
          component: {
            span: 12
          },
          helper: {
            render (h) {
              return (< el-alert title="是否开启页面缓存,需要组件名称和xx.vue页面的name一致" type="warning" />
              )
            }
          }
        }
      },
      {
        title: '侧边可见',
        key: 'visible',
        search: {
          disabled: false
        },
        width: 75,
        type: 'radio',
        dict: {
          data: BUTTON_WHETHER_NUMBER
        },
        form: {
          value: 1,
          component: {
            span: 12
          },
          helper: {
            render (h) {
              return (< el-alert title="是否显示在侧边菜单中" type="warning" />
              )
            }
          }
        }
      },
      {
        title: '状态',
        key: 'status',
        sortable: true,
        search: {
          disabled: false
        },
        width: 80,
        type: 'radio',
        dict: {
          data: BUTTON_STATUS_NUMBER
        },
        form: {
          value: 1,
          component: {
            span: 12
          }
        }
      }
    ]
  }
}
