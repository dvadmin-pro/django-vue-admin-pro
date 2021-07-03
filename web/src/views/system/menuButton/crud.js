/*
 * @创建文件时间: 2021-06-03 00:50:28
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-07-02 23:55:25
 * 联系Qq:1638245306
 * @文件介绍: 菜单的按钮和接口配置
 */
import { request } from '@/api/service'
export const crudOptions = (vm) => {
    return {

        pageOptions: {
            compact: true
        },
        options: {
            tableType: 'vxe-table',
            rowKey: false,
            width: '100%',
            height: '100%', // 表格高度100%, 使用toolbar必须设置
        },
        rowHandle: {
            width: 180,
            edit: {
                thin: true,
                text: "编辑"
            },
            remove: {
                thin: true,
                text: "删除"
            }
        },
        indexRow: { // 或者直接传true,不显示title，不居中
            title: '序号',
            align: 'center',
            width: 100
        },
        viewOptions: {
            disabled: true,
            componentType: 'form'
        },
        formOptions: {
            defaultSpan: 24, // 默认的表单 span
        },
        columns: [{
            title: '关键词',
            key: 'search',
            show: false,
            disabled: true,
            search: {
                disabled: false
            },
            form: {
                disabled: true
            },
            view: { // 查看对话框组件的单独配置
                disabled: true,
            },
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
            title: '名称',
            key: 'name',
            sortable: true,
            search: {
                disabled: false
            },
            type: 'select',
            dict: {
                url: '/api/system/button/',
                label: "name",
                value: "name",
                getData: (url, dict) => {
                    return request({ url: url }).then(ret => {
                        return ret.data.data
                    })
                }
            },
            form: {
                /**
                 *  valueChange 功能大大增强
                 * @param key
                 * @param value 当前选择的值
                 * @param form 当前表单
                 * @param getColumn 获取字段配置的方法，getColumn(keyName) 返回keyName的字段配置，可以动态修改组件配置
                 * @param mode 当前模式:【add、edit、search】
                 * @param component 当前组件的ref
                 * @param immediate 是否是对话框打开后立即触发的
                 * @param getComponent 获取组件Ref的方法， getComponent(keyName), 返回组件ref，可以动态调用该组件的方法
                 */
                valueChange(key, value, form, { getColumn, mode, component, immediate, getComponent }) {

                    form.value = component.dict.dataMap[value].value

                },
                rules: [ // 表单校验规则
                    { required: true, message: '必填项' }
                ],
                component: {
                    span: 12,

                },
                itemProps: {
                    class: { 'yxtInput': true },
                }
            }
        },
        {
            title: '权限值',
            key: 'value',
            disabled: true,
            show: false,
            sortable: true,
            search: {
                disabled: true
            },
            type: 'input',
            form: {
                disabled: true,
                show: false,
                rules: [ // 表单校验规则
                    { required: true, message: '必填项' }
                ],
                component: {
                    span: 12,
                },
                itemProps: {
                    class: { 'yxtInput': true },
                }
            }
        },
        {
            title: '请求方式',
            key: 'method',
            sortable: true,
            search: {
                disabled: false
            },
            type: 'select',
            dict: {
                data: [
                    { label: "GET", value: 0 },
                    { label: "POST", value: 1 },
                    { label: "PUT", value: 2 },
                    { label: "DELETE", value: 3 }
                ]
            },
            form: {
                rules: [ // 表单校验规则
                    { required: true, message: '必填项' }
                ],
                component: {
                    span: 12,
                },
                itemProps: {
                    class: { 'yxtInput': true },
                }
            }
        },
        {
            title: '接口地址',
            key: 'api',
            sortable: true,
            search: {
                disabled: true
            },
            type: 'input',
            form: {
                rules: [ // 表单校验规则
                    { required: true, message: '必填项' }
                ],
                component: {
                    span: 24
                },
                itemProps: {
                    class: { 'yxtInput': true },
                },
                helper: {
                    render(h) {
                        return (< el-alert title="请正确填写，以免请求时被拦截。匹配单例使用正则,例如:/api/xx/(?P<pk>.*?)/" type="warning" />
                        )
                    }
                }
            }
        }
        ]
    }
}