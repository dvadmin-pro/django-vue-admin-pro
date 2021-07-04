import { request } from '@/api/service'
import router from '@/router'
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

        },
        rowHandle: {
            dropdown: {
                atLeast: 4 // 至少2个以上才收入下拉框中
            },
            width: 370,
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
            },
            custom: [{
                show(index, row) {
                    return true
                },
                text: ' 菜单权限',
                type: 'warning',
                size: 'small',
                emit: 'createMenuPermission',
                icon: 'el-icon-s-flag'
            },
            {
                show(index, row) {
                    return true
                },
                text: ' 数据权限',
                type: 'warning',
                size: 'small',
                emit: 'createDataPermission',
                icon: 'el-icon-s-flag'
            }],

        },
        indexRow: { // 或者直接传true,不显示title，不居中
            title: '序号',
            align: 'center',
            width: 100
        },

        viewOptions: {
            componentType: 'row'
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
                disabled: true,
                component: {
                    props: {
                        clearable: true
                    }
                }
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
            title: '角色名称',
            key: 'name',
            sortable: true,
            search: {
                disabled: false,
                component: {
                    props: {
                        clearable: true
                    }
                }
            },

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
                    class: { 'yxtInput': true },
                }
            }
        },
        {
            title: '权限字符',
            key: 'key',
            sortable: true,
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
                    class: { 'yxtInput': true },
                }
            }
        },
        {
            title: '是否管理员',
            key: 'admin',
            sortable: true,

            type: 'radio',
            dict: {
                data: [{ label: "是", value: 1 }, { label: "否", value: 0 }]
            },
            form: {
                value: 0,
                component: {
                    span: 12,
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

            type: 'radio',
            dict: {
                data: [{ label: "启用", value: 1 }, { label: "禁用", value: 0 }]
            },
            form: {
                value: 1,
                component: {
                    span: 12,
                }
            },
            component: { props: { color: 'auto' } }
        },
        {
            title: '排序',
            key: 'sort',
            sortable: true,

            type: 'number',
            form: {
                value: 1,
                component: {
                    span: 12,
                }
            }
        }
        ]
    }
}