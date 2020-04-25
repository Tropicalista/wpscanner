<template>
<div v-if="storeState.finished" class="mb-5">
    <div v-if="storeState.geo" class="row mb-5">
        <div class="col-md-6">
          <h3>Apps used</h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item" v-for="p in storeState.apps.applications">
              <div class="icon-container mr-2"><img :src="'/includes/images/icons/' + p.icon"></div>
              <a :href="p.website" target="_blank">{{p.name}}</a> <code>{{p.version}}</code>
            </li>
          </ul>
        </div>
        <div class="col-md-6">
          <h3>Site Geo IP</h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">IP: {{storeState.geo.ip}}</li>
            <li class="list-group-item">City: {{storeState.geo.city}}</li>
            <li class="list-group-item">Region: {{storeState.geo.region}}</li>
            <li class="list-group-item">Country: <img :src="'/includes/images/flags/' + storeState.geo.country + '.png'" /> {{storeState.geo.country}}</li>
            <li class="list-group-item">Postal Code: {{storeState.geo.postal}}</li>
            <li class="list-group-item">European Union: {{storeState.geo.in_eu}}</li>
            <li class="list-group-item">Latitude/Longitude: {{storeState.geo.latitude}}/{{storeState.geo.longitude}}</li>
            <li class="list-group-item">Time Zone: {{storeState.geo.timezone}}</li>
            <li class="list-group-item">Calling Code: {{storeState.geo.country_calling_code}}</li>
            <li class="list-group-item">Currency: {{storeState.geo.currency}}</li>
            <li class="list-group-item">Languages: {{storeState.geo.languages}}</li>
            <li class="list-group-item">Org: {{storeState.geo.org}}</li>
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