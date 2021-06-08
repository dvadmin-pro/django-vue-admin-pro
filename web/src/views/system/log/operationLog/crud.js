import { request } from '@/api/service'
import XEUtils from 'xe-utils'
export const crudOptions = (vm) => {
  return {
    pageOptions: {
      compact: true
    },
    options: {
      height: '100%',
      align: 'center'
    },
    viewOptions: {
      componentType: 'row'
    },
    formOptions: {
      disabled: true,
      defaultSpan: 24, // 默认的表单 span
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
        title: '请求模块',
        key: 'request_modular',
        sortable: true,

        search: {
          disabled: false
        },
        width: 180,
        type: 'input',
        form: {
          disabled: true
        }
      },
      {
        title: '请求地址',
        key: 'request_path',
        sortable: true,
        search: {
          disabled: false
        },
        width: 180,
        type: 'input',
        form: {
          disabled: true
        }
      },
      {
        title: '请求参数',
        key: 'request_body',
        sortable: true,
        search: {
          disabled: false
        },
        disabled: true,
        width: 180,
        type: 'input',
        form: {
          disabled: true
        }
      },
      {
        title: '请求方法',
        key: 'request_method',
        sortable: true,
        width: 180,
        type: 'input',
        form: {
          disabled: true
        },
        component: { props: { color: 'auto' } } // 自动染色
      },
      {
        title: '操作说明',
        key: 'request_msg',
        sortable: true,
        disabled: true,
        form: {
          component: {
            span: 12,
          }
        }
      },
      {
        title: 'IP地址',
        key: 'request_ip',
        sortable: true,
        search: {
          disabled: false
        },
        width: 180,
        type: 'input',

        form: {
          disabled: true
        },
        component: { props: { color: 'auto' } } // 自动染色
      },
      {
        title: '请求浏览器',
        key: 'request_browser',
        sortable: true,
        width: 180,
        type: 'input',
        form: {
          disabled: true
        },
        component: { props: { color: 'auto' } } // 自动染色
      },
      {
        title: '响应码',
        key: 'response_code',
        sortable: true,
        search: {
          disabled: true,
        },
        type: 'input',
        form: {
          disabled: true
        },
        component: { props: { color: 'auto' } } // 自动染色
      },
      {
        title: '操作系统',
        key: 'request_os',
        sortable: true,
        disabled: true,
        search: {
          disabled: true,
        },
        type: 'input',
        form: {
          disabled: true
        },
        component: { props: { color: 'auto' } } // 自动染色
      },
      {
        title: '返回信息',
        key: 'json_result',
        sortable: true,
        search: {
          disabled: true,
        },
        type: 'input',
        form: {
          disabled: true
        },
        component: { props: { color: 'auto' } } // 自动染色
      }
    ]
  }
}
