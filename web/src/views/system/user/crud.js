import { request } from '@/api/service'
import { BUTTON_STATUS_BOOL } from '@/config/button'
import { urlPrefix as deptPrefix } from '../dept/api'
import util from '@/libs/util'
const uploadUrl = process.env.VUE_APP_API + '/api/system/img/'
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
        disabled () {
          return !vm.hasPermissions('Retrieve')
        }
      },
      edit: {
        thin: true,
        text: '',
        disabled () {
          return !vm.hasPermissions('Update')
        }
      },
      remove: {
        thin: true,
        text: '',
        disabled () {
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
        title: '账号',
        key: 'username',
        search: {
          disabled: false
        },
        width: 160,
        type: 'input',
        form: {
          rules: [ // 表单校验规则
            { required: true, message: '账号必填项' }
          ],
          component: {
            placeholder: '请输入账号'
          },
          itemProps: {
            class: { yxtInput: true }
          },
          helper: {
            render (h) {
              return (< el-alert title="密码默认为:admin123456" type="warning" />
              )
            }
          }
        }
      },
      {
        title: '姓名',
        key: 'name',
        search: {
          disabled: false
        },
        type: 'input',
        form: {
          rules: [ // 表单校验规则
            { required: true, message: '姓名必填项' }
          ],
          component: {
            span: 12,
            placeholder: '请输入姓名'
          },
          itemProps: {
            class: { yxtInput: true }
          }
        }
      },
      {
        title: '部门',
        key: 'dept',
        width: 180,
        type: 'cascader',
        search: {
          disabled: false
        },
        form: {
          rules: [ // 表单校验规则
            { required: true, message: '部门必填项' }
          ],
          component: {
            props: {
              props: { color: 'auto' },
              elProps: {
                clearable: true,
                showAllLevels: false, // 仅显示最后一级
                props: {
                  checkStrictly: true, // 可以不需要选到最后一级
                  emitPath: false
                }
              },
              dict: {
                // cache: true, // 表单的dict可以禁用缓存
                url: deptPrefix,
                body: {
                  status: 1
                },
                isTree: true,
                value: 'id', // 数据字典中value字段的属性名
                label: 'name' // 数据字典中label字段的属性名
              },
              multiple: false,
              clearable: true
            }
          },
          itemProps: {
            class: { yxtInput: true }
          }
        },
        component: {
          props: {
            props: { color: 'auto' },
            dict: {
              // cache: true, // 表单的dict可以禁用缓存
              url: deptPrefix,
              isTree: true,
              value: 'id', // 数据字典中value字段的属性名
              label: 'name' // 数据字典中label字段的属性名
            },
            multiple: false,
            clearable: true
          }
        }
      }, {
        title: '邮箱',
        key: 'email',
        form: {
          rules: [
            { type: 'email', message: '请输入正确的邮箱地址', trigger: ['blur', 'change'] }
          ],
          component: {
            placeholder: '请输入邮箱'
          }
        }
      },
      {
        title: '性别',
        key: 'gender',
        type: 'radio',
        dict: {
          data: [{ label: '男', value: 1 }, { label: '女', value: 0 }]
        },
        form: {
          value: 1,
          component: {
            span: 12
          }
        },
        component: { props: { color: 'auto' } } // 自动染色
      },
      {
        title: '状态',
        key: 'is_active',
        search: {
          disabled: false
        },
        width: 90,
        type: 'radio',
        dict: {
          data: BUTTON_STATUS_BOOL
        },
        form: {
          value: true,
          component: {
            span: 12
          }
        }
      },
      {
        title: '头像',
        key: 'avatar',
        type: 'avatar-uploader',
        width: 150,
        align: 'left',
        form: {
          component: {
            props: {
              uploader: {
                action: uploadUrl,
                name: 'url',
                headers: {
                  Authorization: 'JWT ' + util.cookies.get('token')
                },
                type: 'form',
                successHandle (ret, option) {
                  if (ret.data == null || ret.data === '') {
                    throw new Error('上传失败')
                  }
                  return { url: ret.data.data.url, key: option.data.key }
                }
              },
              elProps: { // 与el-uploader 配置一致
                multiple: true,
                limit: 5 // 限制5个文件
              },
              sizeLimit: 100 * 1024 // 不能超过限制
            },
            span: 24
          },
          helper: '限制文件大小不能超过50k'
        },
        valueResolve (row, col) {
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
            buildUrl (value, item) {
              console.log(11, value)
              if (value && value.indexOf('http') !== 0) {
                return '/api/upload/form/download?key=' + value
              }
              return value
            }
          }
        }
      },
      {
        title: '角色',
        key: 'role',
        search: {
          disabled: true
        }, // 查询的时候触发一个空方法
        type: 'checkbox',

        form: {
          rules: [ // 表单校验规则
            { required: true, message: '必填项' }
          ],
          component: {
            props: {
              dict: {
                cache: false, // 表单的dict可以禁用缓存
                url: '/api/system/role/',
                body: {
                  status: 1
                },
                value: 'id', // 数据字典中value字段的属性名
                label: 'name' // 数据字典中label字段的属性名

              }
            }
          },
          itemProps: {
            class: { yxtInput: true }
          }
        },
        component: {
          props: { color: 'auto' },
          dict: {
            url: '/api/system/role/',
            value: 'id', // 数据字典中value字段的属性名
            label: 'name', // 数据字典中label字段的属性名
            getData: (url, dict) => { // 配置此参数会覆盖全局的getRemoteDictFunc
              return request({ url: url }).then(ret => {
                return ret.data.data
              })
            }
          }
        } // 自动染色
      }
    ].concat(vm.commonEndColumns())
  }
}
