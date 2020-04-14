<template>
  <div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" href="/admin/dashboard">
        <icon name="dashboard" class="w-4 h-4 mr-2" :class="isUrl('') ? 'fill-white' : 'fill-indigo-light group-hover:fill-white'" />
        <div :class="isUrl('') ? 'text-white' : 'text-indigo-lighter group-hover:text-white'">Dashboard</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" href="/admin/themes">
        <icon name="users" class="w-4 h-4 mr-2" :class="isUrl('admin/themes') ? 'fill-white' : 'fill-indigo-light group-hover:fill-white'" />
        <div :class="isUrl('admin/themes') ? 'text-white' : 'text-indigo-lighter group-hover:text-white'">Themes</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" href="/admin/plugins">
        <icon name="office" class="w-4 h-4 mr-2" :class="isUrl('admin/plugins') ? 'fill-white' : 'fill-indigo-light group-hover:fill-white'" />
        <div :class="isUrl('admin/plugins') ? 'text-white' : 'text-indigo-lighter group-hover:text-white'">Plugins</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" href="/admin/providers">
        <icon name="office" class="w-4 h-4 mr-2" :class="isUrl('admin/providers') ? 'fill-white' : 'fill-indigo-light group-hover:fill-white'" />
        <div :class="isUrl('admin/providers') ? 'text-white' : 'text-indigo-lighter group-hover:text-white'">Providers</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" href="/admin/posts">
        <icon name="office" class="w-4 h-4 mr-2" :class="isUrl('admin/posts') ? 'fill-white' : 'fill-indigo-light group-hover:fill-white'" />
        <div :class="isUrl('admin/posts') ? 'text-white' : 'text-indigo-lighter group-hover:text-white'">Posts</div>
      </inertia-link>
    </div>
    <div class="mb-4">
      <inertia-link class="flex items-center group py-3" href="/admin/reports">
        <icon name="printer" class="w-4 h-4 mr-2" :class="isUrl('reports') ? 'fill-white' : 'fill-indigo-light group-hover:fill-white'" />
        <div :class="isUrl('reports') ? 'text-white' : 'text-indigo-lighter group-hover:text-white'">Reports</div>
      </inertia-link>
    </div>
  </div>
</template>

<script>
import Icon from '@admin/Shared/Icon'

export default {
  components: {
    Icon,
  },
  props: {
    url: String,
  },
  methods: {
    isUrl(...urls) {
      if (urls[0] === '') {
        return this.url === ''
      }

      return urls.filter(url => this.url.startsWith(url)).length
    },
  },
}
</script>
