<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Sites</h1>
    <div class="bg-white rounded shadow overflow-x-auto">
      <table class="w-full whitespace-no-wrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4">Url</th>
        </tr>
        <tr v-for="site in sites" :key="site.id" class="hover:bg-grey-lightest focus-within:bg-grey-lightest">
          <td class="border-t px-6 py-4">
              {{ site.url }}
          </td>
        </tr>
        <tr v-if="sites.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No sites found.</td>
        </tr>
      </table>
    </div>
    <pagination :links="sites.pagination" />
  </div>
</template>

<script>
import _ from 'lodash'
import Icon from '@admin/Shared/Icon'
import Layout from '@admin/Shared/Layout'
import Pagination from '@admin/Shared/MyPagination'
import SearchFilter from '@admin/Shared/SearchFilter'

export default {
  metaInfo: { title: 'Reports' },
  layout: (h, page) => h(Layout, [page]),
  components: {
    Icon,
    Pagination,
    SearchFilter,
  },
  props: {
    sites: Array,
    filters: Object,
  },
  data() {
    return {
      form: {
      },
    }
  },
  methods: {
    reset() {
      this.form = _.mapValues(this.form, () => null)
    },
    switchSortOrder() {
      if( this.form.sortOrder == 'desc' ){
        this.form.sortOrder = 'asc'
      }else{
        this.form.sortOrder = 'desc'
      }
    },  
  },
}
</script>
