<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Themes</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-sm mr-4" @reset="reset">
        <label class="block text-grey-darkest">Trashed:</label>
        <select v-model="form.orderBy" class="mt-1 w-full form-select">
          <option :value="null" />
          <option value="hasReferral">Has Referral</option>
          <option value="name">Name</option>
        </select>
      </search-filter>
      <inertia-link class="btn-indigo" href="/admin/themes/new">
        <span>Create</span>
        <span class="hidden md:inline">theme</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded shadow overflow-x-auto">
      <table class="w-full whitespace-no-wrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4"><a v-on:click="form.orderBy = 'name'; switchSortOrder()">Name</a></th>
          <th class="px-6 pt-6 pb-4"><a v-on:click="form.orderBy = 'slug'; switchSortOrder()">Slug</a></th>
          <th class="px-6 pt-6 pb-4">Has Referral</th>
          <th class="px-6 pt-6 pb-4">Hits</th>
          <th class="px-6 pt-6 pb-4" colspan="2"><a v-on:click="form.orderBy = 'author'; switchSortOrder()">Author</a></th>
        </tr>
        <tr v-for="theme in themes.data" :key="theme.id" class="hover:bg-grey-lightest focus-within:bg-grey-lightest">
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo" :href="`/admin/themes/${theme.id}/edit`">
              {{ theme.theme_name }}
              <icon v-if="theme.deleted_at" name="trash" class="flex-no-shrink w-3 h-3 fill-grey ml-2" />
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="`/admin/themes/${theme.id}/edit`" tabindex="-1">
              {{ theme.slug }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="`/admin/themes/${theme.id}/edit`" tabindex="-1">
              {{ theme.referral_url ? 'Yes' : 'No' }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="`/admin/themes/${theme.id}/edit`" tabindex="-1">
              {{ theme.hits }}
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="`/admin/themes/${theme.id}/edit`" tabindex="-1">
              {{ theme.author }}
            </inertia-link>
          </td>
          <td class="border-t w-px">
            <inertia-link class="px-4 flex items-center" :href="`/admin/themes/${theme.id}/edit`" tabindex="-1">
              <icon name="cheveron-right" class="block w-6 h-6 fill-grey" />
            </inertia-link>
          </td>
        </tr>
        <tr v-if="themes.data.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No themes found.</td>
        </tr>
      </table>
    </div>
    <pagination :links="themes.pagination" :type="'themes'" />
  </div>
</template>

<script>
import Icon from '@admin/Shared/Icon'
import Layout from '@admin/Shared/Layout'
import Pagination from '@admin/Shared/MyPagination'
import SearchFilter from '@admin/Shared/SearchFilter'

export default {
  metaInfo: { title: 'Themes' },
  layout: (h, page) => h(Layout, [page]),
  components: {
    Icon,
    Pagination,
    SearchFilter,
  },
  props: {
    themes: Object,
    filters: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        orderBy: this.filters.orderBy,
        sortOrder: 'desc'
      },
    }
  },
  watch: {
    form: {
      handler: _.throttle(function() {
        let query = _.pickBy(this.form)
        console.log(query)
        this.$inertia.replace("/admin/themes", {
          method: 'get',
          data: query
        }) // need to account for query
      }, 150),
      deep: true,
    },
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
