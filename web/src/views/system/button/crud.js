/*
 * @创建文件时间: 2021-06-03 00:34:42
 * @Auther: 猿小天
 * @最后修改人: 猿小天
 * @最后修改时间: 2021-06-30 00:47:54
 * 联系Qq:1638245306
 * @文件介绍: 权限配置
 */
import { request } from '@/api/service'
export const crudOptions = (vm) => {
    return {
        pageOptions: {
            compact: true
        },
        options: {
            tableType: 'vxe-table',
            rowKey: true,
            width: '100%',
            height: '100%', // 表格高度100%, 使用toolbar必须设置
        },
        rowHandle: {
            edit: {
                thin: true,
                text: "编辑",
                disabled() {
                    return !vm.hasPermissions('Update')
                }
            },
            remove: {
                thin: true,
                text: "删除",
                disabled() {
                    return !vm.hasPermissions('Delete')
                }
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

            type: 'input',
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
            title: 'key值',
            key: 'value',
            sortable: true,
            search: {
                disabled: false
            },

            type: 'input',
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
        }
        ]
    }
}