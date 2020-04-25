<template>
<div v-if="storeState.finished" class="mb-5">
    <div v-if="storeState.geo" class="row mb-5">
        <div class="col-md-6">
          <h3>Site Geo IP</h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">IP: {{storeState.geo.ip}}</li>
          </ul>
        </div>
        <div class="col-md-6">
          <h3>Apps used</h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item" v-for="p in storeState.apps.applications">
              <div class="icon-container mr-2"><img :src="'/includes/images/icons/' + p.icon"></div>
              <a :href="p.website">{{p.name}}</a> <code>{{p.version}}</code>
            </li>
          </ul>
        </div>
    </div>
</div>

</template>
<script>
import { store } from "@/store/themeStore.js";

export default {
    data() {
        return {
            storeState: store.state
        };
    }
};
</script>
<style>
.icon-container {
    width: 30px;
    height: 30px;
    display: inline-block;
}
/* resize images */
.icon-container img {
    width: 100%;
    height: auto;
}
</style>