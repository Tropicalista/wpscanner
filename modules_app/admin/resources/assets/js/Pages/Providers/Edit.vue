<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-light hover:text-indigo-dark" href="/admin/providers">Providers</inertia-link>
      <span class="text-indigo-light font-medium">/</span>
      {{ form.name }}
    </h1>
    <div class="bg-white rounded shadow overflow-hidden max-w-lg">
      <form @submit.prevent="submit">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.name" :errors="$page.errors.name" class="pr-6 pb-8 w-full lg:w-1/2" label="Name" />
          <text-input v-model="form.url" :errors="$page.errors.url" class="pr-6 pb-8 w-full lg:w-1/2" label="Url" />
          <text-area-input v-model="form.description" :errors="$page.errors.description" class="pr-6 pb-8 w-full" label="Description" />          
          <text-input v-model="form.screenshot" :errors="$page.errors.screenshot" class="pr-6 pb-8 w-full lg:w-1/2" label="ScreenShot" />
        </div>
        <div class="px-8 py-4 bg-grey-lightest border-t border-grey-lighter flex items-center">
          <button class="text-red hover:underline" tabindex="-1" type="button" @click="destroy">Delete provider</button>
          <loading-button :loading="sending" class="btn-indigo ml-auto" type="submit">Update provider</loading-button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Icon from '@admin/Shared/Icon'
import Layout from '@admin/Shared/Layout'
import LoadingButton from '@admin/Shared/LoadingButton'
import SelectInput from '@admin/Shared/SelectInput'
import TextInput from '@admin/Shared/TextInput'
import TextAreaInput from '@admin/Shared/TextAreaInput'
import TrashedMessage from '@admin/Shared/TrashedMessage'

export default {
  metaInfo() {
    return { title: this.form.name }
  },
  layout: (h, page) => h(Layout, [page]),
  components: {
    Icon,
    LoadingButton,
    SelectInput,
    TextInput,
    TextAreaInput,
    TrashedMessage,
  },
  props: {
    provider: Object,
  },
  remember: 'form',
  data() {
    return {
      sending: false,
      form: {
        name: this.provider.name,
        url: this.provider.url,
        description: this.provider.description,
        screenshot: this.provider.screenshot,
      },
    }
  },
  methods: {
    submit() {
      this.sending = true
      if(!this.provider.id){
        this.$inertia.post("/admin/providers", this.form)
          .then(() => this.sending = false)
      }else{
        this.$inertia.put(`/admin/providers/${this.provider.id}`, this.form)
          .then(() => this.sending = false)
      }
    },
    destroy() {
      if (confirm('Are you sure you want to delete this provider?')) {
        this.$inertia.delete(`/admin/providers/${this.provider.id}`)
      }
    },
    restore() {
      if (confirm('Are you sure you want to restore this provider?')) {
        this.$inertia.put(`/admin/providers/${this.provider.id}/restore`)
      }
    },
  },
}
</script>
