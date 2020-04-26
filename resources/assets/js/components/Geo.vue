<template>
  <div class="col-md-6" v-if="target">
    <h3>Site Geo IP</h3>
    <spinner v-if="loading" />
    <ul class="list-group list-group-flush" v-if="geo.ip">
      <li class="list-group-item">IP: {{geo.ip}}</li>
      <li class="list-group-item">City: {{geo.city}}</li>
      <li class="list-group-item">Region: {{geo.region}}</li>
      <li class="list-group-item">Country: <img :src="'/includes/images/flags/' + geo.country + '.png'" /> {{geo.country}}</li>
      <li class="list-group-item">Postal Code: {{geo.postal}}</li>
      <li class="list-group-item">European Union: {{geo.in_eu}}</li>
      <li class="list-group-item">Latitude/Longitude: {{geo.latitude}}/{{geo.longitude}}</li>
      <li class="list-group-item">Time Zone: {{geo.timezone}}</li>
      <li class="list-group-item">Calling Code: {{geo.country_calling_code}}</li>
      <li class="list-group-item">Currency: {{geo.currency}}</li>
      <li class="list-group-item">Languages: {{geo.languages}}</li>
      <li class="list-group-item">Org: {{geo.org}}</li>
    </ul>
  </div>
</template>
<script>
import { store } from "@/store/themeStore.js"
import Spinner from "@/components/spinner.vue"
import EventBus from "@/event-bus.js";

export default {
    data() {
        return {
            target: "",
            loading: false,
            geo: {}
        };
    },
    mounted() {
        EventBus.$on("scanned-site", (data) => {
          this.loading = true
          this.target = data.baseUrl
          this.getIp( this.target )
        })
    },
    methods: {
        getIp(target) {
            axios
                .post('api/ip', {
                    target: target
                })
                .then(response => {
                    this.geo = response.data
                    this.loading = false
                } )
                .catch(error => console.log( error.response ) )              
        }
    },
    components: {
        Spinner
    }
}
</script>
<style>

</style>