<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">Posts</h1>
    <div class="mb-6 flex justify-between items-center">
      <search-filter v-model="form.search" class="w-full max-w-sm mr-4" @reset="reset">
        <label class="block text-grey-darkest">Trashed:</label>
        <select v-model="form.trashed" class="mt-1 w-full form-select">
          <option :value="null" />
          <option value="with">With Trashed</option>
          <option value="only">Only Trashed</option>
        </select>
      </search-filter>
      <inertia-link class="btn-indigo" href="/admin/posts/new">
        <span>Create</span>
        <span class="hidden md:inline">Post</span>
      </inertia-link>
    </div>
    <div class="bg-white rounded shadow overflow-x-auto">
      <table class="w-full whitespace-no-wrap">
        <tr class="text-left font-bold">
          <th class="px-6 pt-6 pb-4">Title</th>
          <th class="px-6 pt-6 pb-4">Slug</th>
          <th class="px-6 pt-6 pb-4">Created Date</th>
          <th class="px-6 pt-6 pb-4" colspan="2">Phone</th>
        </tr>
        <tr v-for="contact in posts.data" :key="post.id" class="hover:bg-grey-lightest focus-within:bg-grey-lightest">
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center focus:text-indigo" :href="`/admin/posts/${post.id}/edit`">
              {{ post.title }}
              <icon v-if="post.deleted_at" name="trash" class="flex-no-shrink w-3 h-3 fill-grey ml-2" />
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="`/admin/posts/${post.id}/edit`" tabindex="-1">
              <div v-if="post.organization">
                {{ post.slug }}
              </div>
            </inertia-link>
          </td>
          <td class="border-t">
            <inertia-link class="px-6 py-4 flex items-center" :href="`/admin/posts/${post.id}/edit`" tabindex="-1">
              {{ post.createdDate }}
            </inertia-link>
          </td>
          <td class="border-t w-px">
            <inertia-link class="px-4 flex items-center" :href="`/admin/posts/${post.id}/edit`" tabindex="-1">
              <icon name="cheveron-right" class="block w-6 h-6 fill-grey" />
            </inertia-link>
          </td>
        </tr>
        <tr v-if="posts.data.length === 0">
          <td class="border-t px-6 py-4" colspan="4">No posts found.</td>
        </tr>
      </table>
    </div>
    <pagination :links="posts.links" />
  </div>
</template>

<script>
import Icon from '@admin/Shared/Icon'
import Layout from '@admin/Shared/Layout'
import Pagination from '@admin/Shared/Pagination'
import SearchFilter from '@admin/Shared/SearchFilter'

export default {
  metaInfo: { title: 'Contacts' },
  layout: (h, page) => h(Layout, [page]),
  components: {
    Icon,
    Pagination,
    SearchFilter,
  },
  props: {
    posts: Object,
    filters: Object,
  },
  data() {
    return {
      form: {
        search: this.filters.search,
        trashed: this.filters.trashed,
      },
    }
  },
  watch: {
    form: {
      handler: _.throttle(function() {
        let query = _.pickBy(this.form)
        this.$inertia.replace("/contacts") // need to add back in query string
      }, 150),
      deep: true,
    },
  },
  methods: {
    reset() {
      this.form = _.mapValues(this.form, () => null)
    },
  },
}
</script>
