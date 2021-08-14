import { request } from '@/api/service'
import { BUTTON_STATUS_BOOL } from '@/config/button'


export const crudOptions = (vm) => {
  return {
    pageOptions: {
      compact: true
    },
    options: {
      height: '100%'
    },
    rowHandle: {
      width: 140,
      view: {
        thin: true,
        text: '',
        disabled() {
          return !vm.hasPermissions('Retrieve')
        }
      },
      edit: {
        thin: true,
        text: '',
        disabled() {
          return !vm.hasPermissions('Update')
        }
      },
      remove: {
        thin: true,
        text: '',
        disabled() {
          return !vm.hasPermissions('Delete')
        }
      }
    },
    viewOptions: {
      componentType: 'form'
    },
    formOptions: {
      defaultSpan: 12 // 默认的表单 span
    },
    indexRow: { // 或者直接传true,不显示title，不居中
      title: '序号',
      align: 'center',
      width: 100
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
            placeholder: '请输入关键词'
          }
        },
        view: {
          disabled: true
        }
      },
      {
        title: 'ID',
        key: 'id',
        width: 90,
        disabled: true,
        form: {
          disabled: true
        }
      },
      {
        title: '图片名称',
        key: 'name',
        search: {
          disabled: false
        },
        width: 160,
        type: 'input',

      },
      {
        title: '图片地址',
        key: 'img',
        search: {
          disabled: false
        },
        width: 160,
        type: 'input',

      },
      {
        title: '图片',
        key: 'url',
        type: 'image-uploader',
        width: 150,
        align: 'left',
        form: {
          disabled: true
        },
        valueResolve(row, col) {
          const value = row[col.key]
          if (value != null && value instanceof Array) {
            if (value.length >= 0) {
              row[col.key] = value[0]
            } else {
              row[col.key] = null
            }
          }
        },
        component: {
          props: {
            buildUrl(value, item) {
              if (value && value.indexOf('http') !== 0) {
                return '/api/upload/form/download?key=' + value
              }
              return value
            }
          }
        }
      },
      {
        title: '备注',
        key: 'description',
        show: false,
        search: {
          disabled: true
        },
        type: 'textarea',
        form: {
          component: {
            placeholder: '请输入内容',
            showWordLimit: true,
            maxlength: '200',
            props: {
              type: 'textarea'
            }
          }
        }
      }, {
        title: '创建人',
        show: false,
        width: 100,
        key: 'modifier_name',
        form: {
          disabled: true
        }
      },
      {
        title: '更新时间',
        key: 'update_datetime',
        width: 160,
        type: 'datetime',
        form: {
          disabled: true
        }
      },
      {
        title: '创建时间',
        key: 'create_datetime',
        width: 160,
        type: 'datetime',
        form: {
          disabled: true
        }
      }
    ]
  }
}
