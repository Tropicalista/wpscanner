import Vue from 'vue'
import VueMeta from 'vue-meta'
import PortalVue from 'portal-vue'
import { InertiaApp } from '@inertiajs/inertia-vue'

Vue.config.productionTip = false
Vue.use(InertiaApp)
Vue.use(PortalVue)
Vue.use(VueMeta)

let app = document.getElementById('app')

import throttle from 'lodash/throttle'
import pickBy from 'lodash/pickBy'
import mapValues from 'lodash/mapValues'

window._ = { pickBy, throttle, mapValues }

new Vue({
  metaInfo: {
    title: 'Loading…',
    titleTemplate: '%s | Ping CRM',
  },
  render: h => h(InertiaApp, {
    props: {
      initialPage: JSON.parse(app.dataset.page),
      resolveComponent: name => import(/* webpackChunkName: 'modules_app/admin/includes/js/pages/[request]' */ `@admin/Pages/${name}`).then(module => module.default),
    },
  }),
}).$mount(app)
