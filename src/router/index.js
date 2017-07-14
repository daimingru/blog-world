import Vue from 'vue'
import Router from 'vue-router'
import Indexs from '@/components/index/Indexs'
import List from '@/components/list/List'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Indexs',
      component: Indexs
    },
    {
      path: '/list/columns/id/:id',
      name: 'List',
      component: List
    }
  ]
})
