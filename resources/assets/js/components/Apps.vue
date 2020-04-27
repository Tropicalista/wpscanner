<template>
<div class="col-md-6" v-if="target">
    <h3>Apps used</h3>
    <spinner v-if="loading" />
    <ul class="list-group list-group-flush">
        <li class="list-group-item" v-for="a in apps.applications">
            <span class="icon-container mr-2"><img :src="'/includes/images/icons/' + a.icon"></span>
            <a :href="a.website" target="_blank">{{a.name}}</a> <code>{{a.version}}</code>
        </li>
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
            apps: []
        };
    },
    mounted() {
        EventBus.$on("scanned-site", (data) => {
          this.loading = true
          this.target = data.baseUrl
          this.getApps( this.target )
        })
        EventBus.$on("reset", (data) => {
          this.loading = true
          this.target = data.baseUrl
          this.getApps( this.target )
        })
    },
    methods: {
        getApps(target) {
            axios
                .post('/api/apps', {
                    target: target
                })
                .then(response => {
                    this.apps = response.data.data
                    this.loading = false
                } )
                .catch(error => { 
                    this.loading = false
                    console.log( error.response ) 
                } )              
        },
        reset(){
            this.apps = []
            this.target = ""
            this.loading = false
        },
    },
    components: {
        Spinner
    }
}
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