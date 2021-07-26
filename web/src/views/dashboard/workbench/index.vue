<template>
  <d2-container>
    <div class="page-header">

      <el-avatar src="https://q1.qlogo.cn/g?b=qq&amp;nk=190848757&amp;s=640" class="user-avatar">

      </el-avatar>
      <div class="title">
        <h1>早安, DV Admin, 开始您一天的工作吧！</h1>
        <span> 今日晴，20℃ - 32℃！ </span>
      </div>
    </div>

    <el-row :gutter="20">
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>友情链接</span>

            <el-button style="float: right; padding: 3px 0" type="text">
              <el-link href="https://bbs.django-vue-admin.com/links" target="_blank" type="primary">更多</el-link>
            </el-button>
          </div>
          <el-row>
              <el-col :span="8" v-for="({name,icon,team,createTime,slogan},index) in projects" :key="index" style="padding: 0">
              <el-card shadow="hover">
                <div class="project-detail">
                  <div>
                    <d2-icon-svg :name="icon" style="width: 25px;height: 25px;"/>
                    <span v-text="name" class="name"></span>
                  </div>
                  <div v-text="slogan" class="slogan"></div>
                  <div  style="display: flex;justify-content: space-between;">
                    <span v-text="team" class="team"></span>
                    <span v-text="createTime" class="createTime"></span>
                  </div>
                </div>

              </el-card>
              </el-col>
          </el-row>
        </el-card>

        <el-card class="box-card" style="margin-top: 25px">
          <div slot="header" class="clearfix">
            <span>最新动态</span>
            <el-button style="float: right; padding: 3px 0" type="text">更多</el-button>
          </div>

          <el-row>
            <el-col :span="24" v-for="({avatar,message,createTime},index) of activities" :key="index" class="activity">
              <el-avatar :src="avatar" size="small" :key="index" class="activity-avatar"></el-avatar>
              <div style="display: inline-block" class="activity-detail">
                <p v-text="message"></p>
                <p v-text="createTime" style="color: #333333;font-size: 10px"></p>
              </div>
              <el-divider v-if="index+1 < activities.length"></el-divider>
            </el-col>
          </el-row>

        </el-card>

      </el-col>

      <el-col :span="12">
        <div class="grid-content bg-purple">

          <el-card class="box-card" >
            <div slot="header" class="clearfix">
              <span>快捷导航</span>
            </div>
            <el-row>
              <el-col :span="8" v-for="({name,icon,route,color},index) of navigators" :key="index" style="padding: 0">
                <el-card shadow="hover">
                  <div  style="display: flex;align-items: center;flex-direction: column;cursor: pointer" @click="()=>{gotoRoute(route)}">
                    <d2-icon-svg :name="icon" style="width: 25px;height: 25px;" :style="{fill:color}"/>
                    <div style="text-align: center;font-size: 12px;margin-top: 20px" v-text="name"></div>
                  </div>
                </el-card>
              </el-col>
            </el-row>
          </el-card>

          <el-card class="box-card"  style="margin-top: 25px">
            <div class="work">
              <d2-icon-svg name="work" style="margin-left: 50%;transform: translateX(-50%);height: 216px"/>
            </div>
          </el-card>

          <el-card class="box-card"  style="margin-top: 25px">
            <div slot="header" class="clearfix">
              <span>部门统计</span>
            </div>

            <div>
              <v-chart class="chart" :option="option" />
            </div>
          </el-card>
        </div>
      </el-col>
    </el-row>

  </d2-container>
</template>

<script>
import { use } from 'echarts/core'
import { CanvasRenderer } from 'echarts/renderers'
import { PieChart } from 'echarts/charts'
import {
  TitleComponent,
  TooltipComponent,
  LegendComponent
} from 'echarts/components'
import VChart, { THEME_KEY } from 'vue-echarts'
use([
  CanvasRenderer,
  PieChart,
  TitleComponent,
  TooltipComponent,
  LegendComponent
])
export default {
  name: 'workbench',
  components: {
    VChart
  },
  provide: {
    [THEME_KEY]: 'westeros'
  },
  data () {
    return {
      activities: [
        {
          avatar: 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640',
          message: '我们经济落后5000，但我们阵容值10000',
          createTime: '1个小时前'
        },
        {
          avatar: 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640',
          message: 'fnc已经神志不清了',
          createTime: '2个小时前'
        },
        {
          avatar: 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640',
          message: '这个炼金很有艺术性',
          createTime: '3个小时前'
        },
        {
          avatar: 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640',
          message: '对面打得很好，什么？打个分？四分吧',
          createTime: '4个小时前'
        },
        {
          avatar: 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640',
          message: '厂长在三年前种下的果，三年后亲手收获回来！',
          createTime: '4个小时前'
        },
        {
          avatar: 'https://q1.qlogo.cn/g?b=qq&nk=190848757&s=640',
          message: '在没人相信你的时候，你相信了自己并赢得了胜利，这就是成为英雄的道路！',
          createTime: '4个小时前'
        }
      ],
      projects: [
        {
          name: 'Github',
          icon: 'github',
          team: 'OMG',
          slogan: '这波团老干爹看来要输了',
          createTime: '2021-04-01'
        },
        {
          name: 'Django',
          icon: 'django',
          team: 'JDG',
          slogan: '顺境简自豪，逆境狂小狗！',
          createTime: '2021-04-02'
        },
        {
          name: 'Javascript',
          icon: 'javascript',
          team: 'DK',
          slogan: '重铸lck的荣光 我辈义不容辞',
          createTime: '2021-04-03'
        },
        {
          name: 'Python',
          icon: 'python',
          color: '#333399',
          team: 'EDG',
          slogan: '你的野区我养猪',
          createTime: '2021-04-04'
        },
        {
          name: 'Vue',
          icon: 'vue',
          color: '#eb4310',
          team: 'WE',
          slogan: '这波还是赚了，小赚',
          createTime: '2021-04-05'
        },
        {
          name: 'React',
          icon: 'react',
          color: '#ff0000',
          team: 'FPX',
          slogan: '香锅快走啊，小狗也倒了！',
          createTime: '2021-04-01'
        }
      ],
      navigators: [
        {
          name: '首页',
          icon: 'home',
          route: {
            name: 'index'
          },
          color: 'rgb(31, 218, 202);'
        },
        {
          name: '部门管理',
          icon: 'department',
          route: {
            name: 'dept'
          },
          color: 'rgb(225, 133, 37);'
        },
        {
          name: '角色管理',
          icon: 'role',
          route: {
            name: 'role'
          },
          color: 'rgb(191, 12, 44);'
        },
        {
          name: '菜单管理',
          icon: 'menu',
          route: {
            name: 'menu'
          },
          color: 'rgb(63, 178, 127);'
        },
        {
          name: '用户管理',
          icon: 'user',
          route: {
            name: 'user'
          },
          color: 'rgb(191, 12, 44);'
        },
        {
          name: '日志管理',
          icon: 'log',
          route: {
            name: 'operationLog'
          },
          color: 'rgb(0, 216, 255);'
        }
      ],
      chartData: {
        columns: ['日期', '销售额'],
        rows: [
          { 日期: '1月1日', 销售额: 123 },
          { 日期: '1月2日', 销售额: 1223 },
          { 日期: '1月3日', 销售额: 2123 },
          { 日期: '1月4日', 销售额: 4123 },
          { 日期: '1月5日', 销售额: 3123 },
          { 日期: '1月6日', 销售额: 7123 }
        ]
      },
      option: {
        textStyle: {
          fontFamily: 'Inter, "Helvetica Neue", Arial, sans-serif'
        },
        title: {
          text: 'Traffic Sources',
          left: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: [
            'Direct',
            'Email',
            'Ad Networks',
            'Video Ads',
            'Search Engines'
          ]
        },
        series: [
          {
            name: 'Traffic Sources',
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: [
              { value: 335, name: 'Direct' },
              { value: 310, name: 'Email' },
              { value: 234, name: 'Ad Networks' },
              { value: 135, name: 'Video Ads' },
              { value: 1548, name: 'Search Engines' }
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      }
    }
  },
  methods: {
    gotoRoute (route) {
      this.$router.push(route)
    }
  }
}
</script>

<style scoped lang="scss">

  $userAvatarLength: 72px;

  .page-header{
    box-sizing: border-box;
    padding: 16px;
    .user-avatar{
        width: $userAvatarLength;
        height: $userAvatarLength;
        line-height: $userAvatarLength;
      display: inline-block;
    }

    .title{
      display: inline-block;
      padding: 0 0 0 15px;
      position: relative;
      top: -5px;

      h1{
        font-size: 1.125rem;
        font-weight: 500;
        line-height: 1.75rem;
      }
      span{
        font-size: 14px;
        color: rgba(0,0,0,.45);
      }
    }

  }

  .project-detail{
    color: rgba(0,0,0,.45);
      .icon{
        font-size: 30px;
        line-height: 2rem;
      }
    .name{
      margin-left: 1rem;
      font-size: 1.125rem;
      line-height: 2rem;
      height: 2rem;
      display: inline-block;
      color: rgba(0,0,0,.85);
      position: relative;
      top: -5px;
    }
    .slogan{
      font-size: 14px;
      padding: 25px 0;
    }
    .team{
      font-size: 14px;
    }
  }

  .activity{
    padding: 0;
    .activity-avatar{
      width: 40px;
      height: 40px;
      line-height: 40px;
    }
    .activity-detail{
      padding: 15px;
      line-height: 15px;
      font-size: 14px;
      color: rgba(0,0,0,.85);
    }
  }
  .chart {
    height: 408px;
  }

  .el-divider--horizontal{
    margin: 4px 0;
    background: 0 0;
    border-top: 1px solid #e8eaec;
  }
  .el-card, .el-message {
    border-radius: 0;
  }
</style>
