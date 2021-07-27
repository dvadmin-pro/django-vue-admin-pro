/*
 * @创建文件时间: 2021-06-01 22:41:21
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-07-25 22:20:49
 * 联系Qq:1638245306
 * @文件介绍:
 */
export const crudOptions = (vm) => {
  return {
    pageOptions: {
      compact: true
    },
    options: {
      height: '100%'
    },
    viewOptions: {
      componentType: 'row'
    },
    formOptions: {
      defaultSpan: 12 // 默认的表单 span
    },
    columns: [
      {
        title: '编码',
        key: 'id',
        width: 90,
        form: {
          disabled: true
        }
      },
      {
        title: '单选本地',
        key: 'select1',
        sortable: true,
        search: {
          disabled: true
        },
        type: 'select',
        dict: {
          data: [{ value: '1', label: '开启' }, { value: '0', label: '关闭' }, { value: '2', label: '停止' }]
        }
      },
      {
        title: '多选,本地,自动染色',
        key: 'select2',
        sortable: true,
        width: 180,
        search: {
          disabled: false,
          title: '多选'
        },
        type: 'select',
        form: {
          title: '多选本地',
          component: {
            props: {
              filterable: true,
              multiple: true,
              clearable: true
            }
          }
        },
        dict: {
          data: [{ value: 'sz', label: '深圳' }, { value: 'gz', label: '广州' }, { value: 'wh', label: '武汉' }, { value: 'sh', label: '上海' }]
        },
        component: { props: { color: 'auto' } } // 自动染色
      }
    ]
  }
}
