<template>
  <div>
    <h1 class="mb-8 font-bold text-3xl">
      <inertia-link class="text-indigo-light hover:text-indigo-dark" href="/admin/plugins">Plugins</inertia-link>
      <span class="text-indigo-light font-medium">/</span>
      {{ form.name }}
    </h1>
    <trashed-message v-if="plugin.deleted_at" class="mb-6" @restore="restore">
      This plugin has been deleted.
    </trashed-message>
    <div class="bg-white rounded shadow overflow-hidden max-w-lg">
      <form @submit.prevent="submit">
        <div class="p-8 -mr-6 -mb-8 flex flex-wrap">
          <text-input v-model="form.name" :errors="$page.errors.name" class="pr-6 pb-8 w-full lg:w-1/2" label="Name" />
          <text-input v-model="form.slug" :errors="$page.errors.slug" class="pr-6 pb-8 w-full lg:w-1/2" label="Slug" />
          <text-input v-model="form.author" :errors="$page.errors.author" class="pr-6 pb-8 w-full lg:w-1/2" label="Author" />
          <text-input v-model="form.homepage" :errors="$page.errors.homepage" class="pr-6 pb-8 w-full lg:w-1/2" label="Homepage" />
          <text-input v-model="form.referral_url" :errors="$page.errors.referral_url" class="pr-6 pb-8 w-full lg:w-1/2" label="Referral Url" />
          <select-input v-model="form.provider" :errors="$page.errors.providers" class="pr-6 pb-8 w-full lg:w-1/2" label="Provider">
            <option :value="null" />
            <option v-for="p in providers" :value="p.id">{{p.name}}</option>
          </select-input>
          <text-area-input v-model="form.description" :errors="$page.errors.description" class="pr-6 pb-8 w-full" label="Description" />          
          <text-input v-model="form.screenshot" :errors="$page.errors.screenshot" class="pr-6 pb-8 w-full lg:w-1/2" label="ScreenShot" />
          <text-input v-model="form.repository" :errors="$page.errors.repository" class="pr-6 pb-8 w-full lg:w-1/2" label="Repository" />
        </div>
        <div class="px-8 py-4 bg-grey-lightest border-t border-grey-lighter flex items-center">
          <button class="text-red hover:underline" tabindex="-1" type="button" @click="destroy">Delete plugin</button>
          <loading-button :loading="sending" class="btn-indigo ml-auto" type="submit">Update plugin</loading-button>
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
    providers: Array,
    plugin: Object,
  },
  remember: 'form',
  data() {
    return {
      sending: false,
      form: {
        name: this.plugin.name,
        slug: this.plugin.slug,
        author: this.plugin.author,
        homepage: this.plugin.homepage,
        description: this.plugin.description,
        screenshot: this.plugin.screenshot,
        referral_url: this.plugin.referral_url,
        repository: this.plugin.repository,
        provider: this.plugin.provider,
        lastFoundOn: this.plugin.lastFoundOn,
      },
    }
  },
  methods: {
    submit() {
      this.sending = true
      if(!this.plugin.id){
        this.$inertia.post("/admin/plugins", this.form)
          .then(() => this.sending = false)
      }else{
        this.$inertia.put(`/admin/plugins/${this.plugin.id}`, this.form)
          .then(() => this.sending = false)
      }
    },
    destroy() {
      if (confirm('Are you sure you want to delete this plugin?')) {
        this.$inertia.delete(`/admin/plugins/${this.plugin.id}`)
      }
    },
    restore() {
      if (confirm('Are you sure you want to restore this plugin?')) {
        this.$inertia.put(`/admin/plugins/${this.plugin.id}/restore`)
      }
    },
  },
}
</script>
