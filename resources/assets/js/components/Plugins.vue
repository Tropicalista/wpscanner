<template>
<div v-if="show" class="mb-5">
  <div class="row">
      <div class="col-md-12">
          <h2 class="pb-2">Plugins</h2>
          <spinner v-if="loading" />
          <div class="alert alert-danger" role="alert" v-if="!pluginList.length && !loading">
            No WordPress Plugin found!
          </div>
      </div>
  </div>
  <div class="card mb-3 shadow-sm" v-for="p in pluginList">
      <div class="row no-gutters">
        <div class="col-md-4">
          <a :href="getUrl(p)" target="_blank">
            <img :src="p.screenshot" class="card-img" />
          </a>
        </div>
        <div class="col-md-8">
          <div class="card-body">
            <h5 class="card-title"><a :href="getUrl(p)" target="_blank">{{p.name}}</a></h5>
            <p class="card-text" :inner-html.prop="p.description | truncate"></p>
            <p class="card-text"><small class="text-muted">Author: {{p.author}}</small></p>
          </div>
        </div>
      </div>
  </div>
</div>
</template>
<script>
import EventBus from "@/event-bus.js";
import Spinner from "@/components/spinner.vue"

export default {
    data() {
        return {
            slugs: [],
            show: false,
            loading: false,
            plugins: [],
            baseUrl: "",
            pluginList: []
        };
    },
    mounted() {
        EventBus.$on("reset", (data) => {
          this.show = false
          this.reset()
        })
        EventBus.$on("scanned-site", (data) => {
          this.show = true
          this.loading = true
          this.getPlugins( data )
        })
    },
    methods:{
      getUrl( plugin ){
        return '/out/plugin/' + plugin.slug
      },
      getPlugins(data){
        this.baseUrl = data.baseUrl
        if(!data.plugins){
          this.loading = false
          return
        }
        this.slugs = data.plugins
        return Promise.all( this.slugs.map( this.fetchData ) )
          .then( resp => {
            this.plugins = resp
            this.askToDB()
          })
      },
      fetchData( plugin ) {
        return axios
          .get( 'https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]=' + plugin)
          .then(function(response) {
            // if not found add to array notFound
            if(response.data.error){
              response.data = {
                notFound: true,
                slug: plugin,
              }
            }
            return response.data
          })
          .catch(function(error) {
            return { success: false, error: error };
          });
      },
      askToDB(){
        axios.post('/api/plugins', { 
          plugins: this.plugins,
          slugs: this.slugs,
          baseUrl: this.baseUrl
        } )
        .then( resp => {
            this.pluginList = resp.data
            if(!this.pluginList.length){
              this.noPlugins = false
            }
            this.loading = false
        })
      },
      reset(){
        this.pluginList = []
        this.basseUrl = ""
        this.plugins = []
        this.loading = false
        this.show = false
      },
    },
    components: {
      Spinner
    }
};
</script>