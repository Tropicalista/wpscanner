<template>
<div v-if="show" class="mb-5">
    <div class="row">
        <div class="col-md-12">
            <h2 class="pb-2">Themes</h2>
            <spinner v-if="loading" />
            <div class="alert alert-danger" role="alert" v-if="!loading && !themes.length">
              No WordPress Theme found!
            </div>
        </div>
    </div>
    <div v-for="t in themes" class="card mb-3 shadow-sm">
        <div class="row no-gutters">
            <div class="col-md-4">
                <a :href="getUrl( t )" target="_blank">
                    <img :src="t.screenshot" class="card-img" v-if="t.screenshot">
                    <svg v-else class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                        <title>Placeholder</title>
                        <rect width="100%" height="100%" fill="#55595c"></rect>
                        <text x="50%" y="50%" fill="#eceeef" dy=".3em">No screenshot</text>
                    </svg>
                </a>
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title"><a :href="getUrl( t )" target="_blank">{{t.name}}</a></h5>
                    <ul v-if="t.name">
                        <li><b>Title:</b> {{t.name}}</li>
                        <li><b>Description:</b> {{t.description | truncate }}</li>
                        <li><b>Author:</b> {{t.author}}</li>
                        <li><b>Version:</b> {{t.version}}</li>
                        <li><b>Url:</b> <a :href="getUrl( t )" target="_blank">{{t.themeUri}}</a></li>
                    </ul>
                    <h3 v-else>We have found a WordPress theme on this site, but cannot find any additional informations. Sorry!</h3>
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
            show: false,
            loading: false,
            themes: []
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
          this.getTheme( data )
        })
    },
    methods:{
        getUrl( theme ){
            return '/out/theme/' + theme.slug
        },
        getTheme( data ) {
            axios
            .post('/api/wordpress/theme', {
                theme: data.theme
            })
            .then( ( response ) => {
                this.themes = response.data.data
                // get or insert from database so we can have referral links
                this.getThemeFromDB( this.themes )
            } )
            .catch( ( error ) => { 
                this.finish()
                console.log( error ) 
            } )              
        },
        getThemeFromDB( theme ) {
            axios
            .post('/api/themeFromDb', {
                theme: theme
            })
            .then(response => {
                this.themes = response.data 
                this.finish()
            } )
            .catch( ( error ) => { 
                this.finish()
                console.log( error ) 
            } )              
        },
        finish() {
            this.loading = false
        },
        reset() {
            this.loading = false
            this.show = false
            this.themes = []
        }
    },
    components: {
        Spinner
    }
}
</script>