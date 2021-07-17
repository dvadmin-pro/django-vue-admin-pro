import { request } from '@/api/service'
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
      // columnHeader: '操作',
      width: 370,
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
        emit: 'createPermission',
        icon: 'el-icon-s-flag'
      }]

    },
    indexRow: { // 或者直接传true,不显示title，不居中
      title: '序号',
      align: 'center',
      width: 80
    },

    viewOptions: {
      componentType: 'row'
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
          disabled: false
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
        width: 90,
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
          url: '/api/system/menu_tree/',
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
      }, {
        title: '图标',
        key: 'icon',
        width: 80,
        type: 'icon-selector',
        form: {
          component: {
            span: 8

          }
        }
      }, {
        title: '排序',
        key: 'sort',
        width: 80,
        type: 'number',
        form: {
          value: 1,
          component: {
            span: 12
          }
        }
      },
      {
        title: '是否外链接',
        key: 'is_link',
        width: 100,
        type: 'radio',
        dict: {
          data: [{ label: '是', value: 1 }, { label: '否', value: 0 }]
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
        form: {
          component: {
            span: 12,
            props: {
              clearable: true
            }
          }
        }
      },
      {
        title: '权限',
        key: 'menuPermission',
        width: 260,
        type: 'select',
        form: {
          disabled: true,
          component: {
            span: 8,
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
              return ret.data.data
            })
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
        width: 90,
        type: 'radio',
        dict: {
          data: [{ label: '启用', value: 1 }, { label: '禁用', value: 0 }]
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
