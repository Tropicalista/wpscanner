<template>
<div v-if="storeState.finished" class="mb-5">
  <div v-if="storeState.finished" class="row">
      <div class="col-md-12">
          <h2 class="pb-2">Plugins</h2>
          <div class="alert alert-danger" role="alert" v-if="storeState.noPlugins">
            No WordPress Theme found!
          </div>
      </div>
  </div>
  <div class="card mb-3 shadow-sm" v-for="p in storeState.pluginList">
      <div class="row no-gutters">
        <div class="col-md-4">
          <a :href="p.homepage" target="_blank">
            <img :src="p.screenshot" class="card-img">
          </a>
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title"><a :href="p.homepage" target="_blank">{{p.name}}</a></h5>
            <p class="card-text" :inner-html.prop="p.description | truncate"></p>
            <p class="card-text"><small class="text-muted">Author: {{p.author}}</small></p>
          </div>
        </div>
      </div>
  </div>
</div>
</template>
<script>
import { plugin } from '@/store/pluginStore.js'

export default {
    data() {
        return {
            storeState: plugin.state
        };
    }
};
</script>

<style>
    h1 {
        color: green;
    }
</style>