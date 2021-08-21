<template>
  <d2-container :class="{ 'page-compact': false }">
    <el-row class="search_plugins" :gutter="20">
      <el-col :span="8"></el-col>
      <el-col :span="4">
        <el-input size="small" v-model="keyword" placeholder="插件关键字"></el-input>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="4">
        <el-row class="tac">
          <el-menu
            default-active="2"
            size="mini"
            :default-openeds="['1', '2']"
            class="el-menu-vertical-demo"
            :collapse="false"
          >
            <el-submenu index="1">
              <template slot="title">
                <span>发现</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="1-1" @click="init"><i class="el-icon-shopping-cart-2" style="margin-right: 10px"></i>最新上架</el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title">
                <span>分类</span>
              </template>
              <el-menu-item-group>
                <el-menu-item index="1-1" @click="init"><i class="el-icon-suitcase-1" style="margin-right: 10px"></i>全部</el-menu-item>
              </el-menu-item-group>
            </el-submenu>
          </el-menu>
        </el-row>
      </el-col>
      <el-col :span="20" class="plugin_list" v-show="!details">
        <el-row>
          <div class="grid-content bg-purple-light" v-for="(market,index) in marketData" :key="index"
               @click="pluginClick(market,index)">
            <el-col :span="7" class="plugin_item">
              <el-row :gutter="20">
                <el-col :span="8" class="plugin_img">
                  <img :src="market.logo" style="width:90px;height:90px">
                </el-col>
                <el-col :span="16">
                  <div style="text-align: right;height: 20px;">
                    <span v-for="(state,inx) in market.status" :key="inx">
                      <el-tag
                        v-if="state && status[state] "
                        size="mini"
                        :type="status[state].type"
                        style="margin-left: 5px">
                      {{ status[state].label }}
                    </el-tag>
                    </span>
                  </div>
                  <div class="plugin_title">{{ market.name }}</div>
                  <div class="plugin_content">{{ market.describe }}</div>
                </el-col>
              </el-row>
              <br>
              <el-row :gutter="20" class="plugin_info" style="font-size: 13px;text-align:right">
                <el-col :span="8">
                  {{ market.tags || (market.tagsList && market.tagsList[0])}}
                </el-col>
                <el-col :span="8">
                  {{ market.author }}
                </el-col>
                <el-col :span="8">
                  {{ market.date }}
                </el-col>
              </el-row>
              <br>
              <div style="text-align: right">
                <el-tag
                  v-for="(label,inx) in market.labels"
                  effect="plain"
                  size="mini"
                  :key="inx"
                  style="margin-left: 5px">
                  {{ label }}
                </el-tag>
                <el-tag
                  effect="plain"
                  size="mini"
                  :type="market.type==='web'?'warning':'success'"
                  style="margin-left: 5px">
                  {{ market.type === 'web' ? '前端' : '后端' }}
                </el-tag>
              </div>
            </el-col>
          </div>
        </el-row>
      </el-col>
      <el-col :span="20" class="plugin_list" v-if="details">
        <el-page-header @back="goBack" content="详情页面"/>
        <br>
        <div>
          <el-row>
            <el-col :span="8" class="plugin_img">
              <img :src="currentForm.logo" style="width:50px;height:50px">
              <div style="position: absolute;width: 500px;left: 70px;top: 0;">
                <div style="color: green;font-size: 14px;">{{ currentForm.name }}</div>
                <div style="font-size: 12px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;">{{
                  currentForm.describe }}
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
        <br>
        <el-tabs type="card">
          <el-tab-pane label="应用信息">
            <el-row>
              <el-col :span="14">
                应用信息
              </el-col>
            </el-row>
          </el-tab-pane>
          <el-tab-pane label="应用详情">
            <el-row>
              <el-col :span="14">
                应用信息
              </el-col>
            </el-row>
          </el-tab-pane>
        </el-tabs>
        <el-row>
          <el-col :span="6" :offset="2" style="position: fixed;right: 50px;top: 350px;">
            <el-descriptions class="margin-top" title="基本操作" :column="1">
              <template slot="extra">
                <span style="position: fixed;top: 290px;right: 60px;">
                  <el-select v-model="currentForm.tags" placeholder="请选择" clearable style="margin-right: 10px;">
                  <el-option
                    v-for="(item,index) in currentForm.tagsList"
                    :key="index"
                    :label="item"
                    :value="item">
                  </el-option>
                </el-select>
                  <el-button type="primary" v-if="operationType.indexOf('install')!==-1" size="small" round @click="Install">安装</el-button>
                  <el-button type="success" v-if="operationType.indexOf('update')!==-1" size="small" round @click="Update(true,'update')">更新</el-button>
                  <el-button type="primary" v-if="operationType.indexOf('notEnabled')!==-1" size="small" round @click="Update(true,'enabled')">启用</el-button>
                  <el-button type="info" v-if="operationType.indexOf('enabled')!==-1" size="small" round @click="Update(false,'enabled')">禁用</el-button>
                  <el-button type="danger" v-if="operationType.indexOf('delete')!==-1" size="small" round @click="Delete">卸载</el-button>
                </span>
              </template>
              <el-descriptions-item label="类别">
                <el-tag size="mini" v-for="(labels,index) in currentForm.labels" :key="index">{{labels}}</el-tag>
              </el-descriptions-item>
              <el-descriptions-item label="首页">
                <el-link type="primary" :href="currentForm.git" target="_blank">{{currentForm.git}}</el-link>
              </el-descriptions-item>
              <el-descriptions-item label="最近更新时间">{{currentForm.date}}</el-descriptions-item>
            </el-descriptions>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </d2-container>
</template>

<script>
import axios from 'axios'
import * as api from './api'
import { successMsg } from '@/api/tools' // 引入axios
const Base64 = require('js-base64').Base64
export default {
  name: 'pluginsMarket',
  data () {
    return {
      keyword: '',
      details: false,
      isGroup: false,
      operationType: ['install'],
      currentForm: {},
      currentPluginsName: '',
      status: {
        update: { label: '可更新', icon: '', type: '' },
        enabled: { label: '已启用', icon: '', type: 'success' },
        notEnabled: { label: '未启用', icon: '', type: 'warning' }
      },
      // 插件市场json地址
      marketUrl: 'https://gitee.com/api/v5/repos/dvadmin/dvadmin_plugins/contents/market.json',
      backendUrl: 'http://127.0.0.1:8000/api/plugins_market/manage',
      marketData: {}
    }
  },
  created () {
    this.init()
  },
  methods: {
    init () {
      this.goBack()
      this.getMarket()
    },
    getMarket () {
      axios({
        url: this.marketUrl,
        method: 'get'
      }).then(response => {
        if (response.data) {
          var marketData = JSON.parse(Base64.decode(response.data.content))
          for (const item in marketData) {
            marketData[item].status = []
          }
          api.GetList().then(response => {
            var data = response.data.data
            for (const item in data) {
              const plugin = data[item]
              const market = marketData[item]
              if (!market) continue
              // 1.判断状态，status ['enabled', 'update','notEnabled']
              marketData[item].status.push(plugin.enable ? 'enabled' : 'notEnabled')
              if (marketData[item].tagsList && (plugin.tags !== marketData[item].tagsList[0])) {
                marketData[item].status.push('update')
              }
              marketData[item].status.push('delete')
              // 2.当前 tags
              marketData[item].tags = plugin.tags
            }
            this.marketData = marketData
            console.log(marketData)
          })
        }
      }).catch(function (err) {
        console.log(err)
      })
    },
    pluginClick (row, currentPluginsName) {
      this.currentPluginsName = currentPluginsName
      this.currentForm = JSON.parse(JSON.stringify(row))
      this.details = true
      // 1. 是否已安装
      // 2. 校验是否要更新
      this.operationType = []
      if (!this.currentForm.status[0]) {
        this.operationType.push('install')
      } else if (this.currentForm.status.indexOf('update') !== -1) {
        this.operationType.push('update')
        this.operationType.push('delete')
      } else if (this.currentForm.status.indexOf('notEnabled') !== -1) {
        this.operationType.push('notEnabled')
        this.operationType.push('delete')
      } else if (this.currentForm.status.indexOf('enabled') !== -1) {
        this.operationType.push('enabled')
        this.operationType.push('delete')
      } else {
        this.operationType.push('delete')
      }
    },
    goBack () {
      this.details = false
      this.currentForm = {}
      this.currentPluginsName = ''
    },
    Install () {
      const data = this.currentForm
      data.enable = true
      api.createObj({ plugins_name: this.currentPluginsName, data }).then(response => {
        successMsg(response.msg)
        this.init()
      })
    },
    Update (enable, updateType) {
      const data = this.currentForm
      data.enable = enable
      data.updateType = updateType
      api.UpdateObj({ plugins_name: this.currentPluginsName, data }).then(response => {
        successMsg(response.msg)
        this.init()
      })
    },
    Delete () {
      api.DelObj({ plugins_name: this.currentPluginsName }).then(response => {
        successMsg(response.msg)
        this.init()
      })
    }
  }
}
</script>

<style scoped>
  .search_plugins {
    margin: 15px;
  }

  .search_plugins .search_button {
  }

  .plugin_list .plugin_item {
    margin: 10px;
    padding: 10px 20px;
    border-radius: 5px;
    box-shadow: #555555 0px 0px 3px;
  }

  .plugin_list .plugin_item:hover {
    box-shadow: #333 0px 0px 5px;
    cursor: pointer;
  }

  .plugin_list .plugin_item .plugin_img {
    margin: 0 auto;
  }

  .plugin_list .plugin_item img {
    width: 100%;
  }

  .plugin_list .plugin_title {
    margin-top: 5px;
    font-size: 14px;
    color: green;
  }

  .plugin_list .plugin_content {
    margin-top: 5px;
    font-size: 12px;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    display: -webkit-box;
  }

  .plugin_list .plugin_info {
    font-size: 15px;
    color: #a8a8a8;
  }
</style>
