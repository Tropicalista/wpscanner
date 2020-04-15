<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-light hover:text-indigo-dark" href="/admin/posts">Posts</inertia-link>
      <span class="text-indigo-light font-medium">/</span>
      {{ form.title }}
    </h1>
    <div class="bg-white rounded shadow overflow-hidden max-w-lg">
      
      <form @submit.prevent="submit">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.title" :errors="$page.errors.title" class="pr-6 pb-8 w-full" label="Title" />
          <div class="pr-6 pb-8 w-full">
            <editor-input v-model="form.content" :errors="$page.errors.content" label="Content" />
          </div>
          <text-input v-model="form.meta_title" :errors="$page.errors.meta_title" class="pr-6 pb-8 w-full" label="Meta Title" />
          <text-input v-model="form.meta_description" :errors="$page.errors.meta_description" class="pr-6 pb-8 w-full" label="Meta Description" />
        </div>
        <div class="px-8 py-4 bg-grey-lightest border-t border-grey-lighter flex items-center">
          <button class="text-red hover:underline" tabindex="-1" type="button" @click="destroy">Delete Post</button>
          <loading-button :loading="sending" class="btn-indigo ml-auto" type="submit">Update Post</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Layout from '@admin/Shared/Layout'
import LoadingButton from '@admin/Shared/LoadingButton'
import EditorInput from '@admin/Shared/EditorInput'
import TextInput from '@admin/Shared/TextInput'
import TrashedMessage from '@admin/Shared/TrashedMessage'

export default {
  metaInfo() {
    return {
      title: `${this.form.title}`,
    }
  },
  layout: (h, page) => h(Layout, [page]),
  components: {
    LoadingButton,
    EditorInput,
    TextInput,
    TrashedMessage,
  },
  props: {
    post: Object,
    organizations: Array,
  },
  remember: 'form',
  data() {
    return {
      sending: false,
      form: {
        title: this.post.title,
        content: this.post.content,
        meta_title: this.post.meta_title,
        meta_description: this.post.meta_description,
      },
    }
  },
  methods: {
    submit() {
      this.sending = true
      this.$inertia.put(`/admin/posts/${this.post.id}`, this.form)
        .then(() => this.sending = false)
    },
    destroy() {
      if (confirm('Are you sure you want to delete this contact?')) {
        this.$inertia.delete(`/admin/posts/${this.post.id}`)
      }
    },
    restore() {
      if (confirm('Are you sure you want to restore this contact?')) {
        this.$inertia.put(`/admin/posts/${this.post.id}/restore`)
      }
    },
  },
}
</script>
