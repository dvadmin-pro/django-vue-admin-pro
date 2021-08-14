import Vue from 'vue'
// import d2Crud from '@d2-project/d2-crud'
import d2CrudX from 'd2-crud-x'
import { d2CrudPlus } from 'd2-crud-plus'
import {
  D2pAreaSelector,
  D2pDemoExtend,
  D2pFileUploader,
  D2pFullEditor,
  D2pIconSelector,
  D2pTreeSelector,
  D2pUploader
} from 'd2p-extends' // 源码方式引入，上传组件支持懒加载
// http请求
import { request } from '@/api/service'
import ECharts from 'vue-echarts'
import util from '@/libs/util'
import XEUtils from 'xe-utils'
import { urlPrefix as deptPrefix } from '@/views/system/dept/api'

/**
 // vxe0
 import 'xe-utils'
 import VXETable from 'vxe-table'
 import 'vxe-table/lib/index.css'
 Vue.use(VXETable)
 **/

// 按如下重命名引入可与官方版共存，index.vue中标签用<d2-crud-x />使用加强版
// 不传name，则d2CrudX的标签仍为<d2-crud>,不可与官方版共存
Vue.use(d2CrudX, { name: 'd2-crud-x' })

// // 官方版【此处为演示与官方版共存而引入，全新项目中可以用d2-crud-x完全替代官方版】
// Vue.use(d2Crud)

// 引入d2CrudPlus
Vue.use(d2CrudPlus, {
  starTip: false,
  getRemoteDictFunc (url, dict) {
    // 此处配置你的字典http请求方法
    // 实际使用请改成request
    return request({
      url: url,
      params: dict.body,
      method: 'get'
    }).then(ret => {
      if (dict.isTree) {
        return XEUtils.toArrayTree(ret.data.data, { parentKey: 'parent', strict: true })
      } else {
        return ret.data.data
      }
    })
  },
  commonOption () { // 公共配置
    return {
      format: {
        page: { // page接口返回的数据结构配置，
          request: {
            current: 'page',
            size: 'limit'
          },
          response: {
            current: 'page', // 当前页码 ret.data.current
            size: 'limit', // 当前页码 ret.data.current
            // size: (data) => { return data.size }, // 每页条数，ret.data.size, 你也可以配置一个方法，自定义返回
            total: 'total', // 总记录数 ret.data.total
            records: 'data' // 列表数组 ret.data.records
          }
        }
      },
      pageOptions: {
        compact: true
      },
      options: {
        size: 'small'
      },
      formOptions: {
        nullToBlankStr: true, // 提交修改表单时，将undefinded的数据修改为空字符串''，可以解决无法清空字段的问题
        defaultSpan: 12, // 默认的表单 span
        saveRemind: true
      },
      viewOptions: {
        disabled: false,
        componentType: 'form' // 【form,row】 表单组件 或 行组件展示
      },
      rowHandle: {
        width: 260,
        edit: {
          type: 'primary'
        }
      }
    }
  }
})

// 安装扩展插件
Vue.use(D2pTreeSelector)
Vue.use(D2pAreaSelector)
Vue.use(D2pIconSelector)
Vue.use(D2pFullEditor, {
  ueditor: {
    serverUrl: '/api/ueditor/'
  }
})
Vue.use(D2pDemoExtend)
Vue.use(D2pFileUploader)
Vue.use(D2pUploader, {
  defaultType: 'cos',
  cos: {
    domain: 'https://d2p-demo-1251260344.cos.ap-guangzhou.myqcloud.com',
    bucket: 'd2p-demo-1251260344',
    region: 'ap-guangzhou',
    secretId: '', //
    secretKey: '', // 传了secretKey 和secretId 代表使用本地签名模式（不安全，生产环境不推荐）
    getAuthorization (custom) { // 不传secretKey代表使用临时签名模式,此时此参数必传（安全，生产环境推荐）
      return request({
        url: '/upload/cos/getAuthorization',
        method: 'get'
      }).then(ret => {
        // 返回结构如下
        // ret.data:{
        //   TmpSecretId,
        //   TmpSecretKey,
        //   XCosSecurityToken,
        //   ExpiredTime, // SDK 在 ExpiredTime 时间前，不会再次调用 getAuthorization
        // }
        return ret.data
      })
    }
  },
  alioss: {
    domain: 'https://d2p-demo.oss-cn-shenzhen.aliyuncs.com',
    bucket: 'd2p-demo',
    region: 'oss-cn-shenzhen',
    accessKeyId: '',
    accessKeySecret: '',
    getAuthorization (custom, context) { // 不传accessKeySecret代表使用临时签名模式,此时此参数必传（安全，生产环境推荐）
      return request({
        url: '/upload/alioss/getAuthorization',
        method: 'get'
      }).then(ret => {
        return ret.data
      })
    },
    sdkOpts: { // sdk配置
      secure: true // 默认为非https上传,为了安全，设置为true
    }
  },
  qiniu: {
    bucket: 'd2p-demo',
    getToken (custom) {
      return request({
        url: '/upload/qiniu/getToken',
        method: 'get'
      }).then(ret => {
        return ret.data // {token:xxx,expires:xxx}
      })
    },
    domain: 'http://d2p.file.veryreader.com'
  },
  form: {
    action: util.baseURL() + 'upload/form/upload',
    name: 'file'
  }
})

// 修改官方字段类型
const selectType = d2CrudPlus.util.columnResolve.getType('select')
selectType.component.props.color = 'auto' // 修改官方的字段类型，设置为支持自动染色

Vue.component('v-chart', ECharts)
// 默认Columns 结尾
Vue.prototype.commonEndColumns = function (value) {
  return [
    {
      title: '备注',
      key: 'description',
      show: value.show_description || false,
      search: {
        disabled: true
      },
      type: 'textarea',
      form: {
        component: {
          span: 12,
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
      show: value.show_modifier_name || false,
      width: 100,
      key: 'modifier_name',
      form: {
        disabled: true
      }
    }, {
      title: '数据归属部门',
      key: 'dept_belong_id',
      show: value.show_dept_belong_id || false,
      search: {
        disabled: true
      },
      type: 'cascader',
      dict: {
        cache: true,
        url: '/api/system/dept/?limit=999&status=1',
        isTree: true,
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
              props: {
                showAllLevels: false, // 仅显示最后一级
                checkStrictly: true, // 可以不需要选到最后一级
                emitPath: false,
                clearable: true
              }
            }
          }
        }
      },
      component: {
        dict: {
          cache: true,
          url: deptPrefix + '?limit=999&status=1',
          isTree: true,
          value: 'id', // 数据字典中value字段的属性名
          label: 'name', // 数据字典中label字段的属性名
          children: 'children', // 数据字典中children字段的属性名
          getData: (url, dict) => { // 配置此参数会覆盖全局的getRemoteDictFunc
            return request({ url: url }).then(ret => {
              return [{ id: null, name: '根节点', children: ret.data.data }]
            })
          }
        }
      }
    },
    {
      title: '更新时间',
      key: 'update_datetime',
      width: 160,
      show: value.show_datetime || true,
      type: 'datetime',
      sortable: true,
      form: {
        disabled: true
      }
    },
    {
      title: '创建时间',
      key: 'create_datetime',
      width: 160,
      show: value.show_create_datetime || true,
      type: 'datetime',
      sortable: true,
      form: {
        disabled: true
      }
    }
  ]
}
