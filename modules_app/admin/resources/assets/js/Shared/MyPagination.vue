<template>
  <div class="mt-6 -mb-1 flex flex-wrap">
    <template v-for="index in links.totalPages">
      <inertia-link :key="index" class="mr-1 mb-1 px-4 py-3 text-sm border rounded hover:bg-white focus:border-indigo focus:text-indigo" :href="`/admin/${type}?page=${index}`">{{ index }}</inertia-link>
    </template>
  </div>
</template>

<script>
export default {
  props: {
    links: Object,
    type: String,
  },
}
</script>
