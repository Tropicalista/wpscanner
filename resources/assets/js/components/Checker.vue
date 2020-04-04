<template>
<form v-on:submit.prevent>
    {{storeState}}
    <div class="form-group">
        <label for="exampleInputEmail1">Email address</label>
        <div class="input-group mb-3">
            <input type="text" class="form-control" :class="{ 'is-invalid' : hasError }" placeholder="https://www.example.com" aria-label="Recipient's username" aria-describedby="basic-addon2" v-model="target" v-on:keyup.enter="validate(target)" @keydown.space.prevent>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" bnvb v-on:click="validate(target)">Button</button>
            </div>            
            <div class="invalid-feedback">
            Please insert a valid URL
            </div> 
        </div>  
    </div>
</form>
</template>
<script>
import { store } from "@/store/simpleStore.js";
import service from "@/services/pluginService.js";

export default {
    data() {
        return {
            storeState : store,
            target: '',
            hasError: false,
            loading: false
        };
    },
    methods: {
        validate(target){
            store.reset()
            axios
                .post('/api/validate', {
                    target: target
                })
                .then(response => {
                    this.scan(target)
                } )
                .catch(error => {
                    this.hasError = true
                } )

        },
        scan( target ) {
            this.loading = true
            this.hasError = false
            axios
                .post('/api/wordpress/scan', {
                    target: target
                })
                .then(response => {
                    console.log(response.data.data)
                    let data = response.data.data
                    this.getApps( data.baseUrl )
                    if(data.plugins.length){
                        this.getPlugins( data.plugins )
                    }
                    if(data.theme.slug.length){
                        this.getTheme( data.theme )  
                    }
                } )
                .catch(error => {
                    console.log( error )
                } )
                .then( () => {
                    // always executed
                    this.loading = false
                });             
        },
        getPlugins(plugins) {
            if(!plugins.length){
                return
            }
            let arrUrls = []
            for( const p of plugins ){
                //arrUrls.push( 'https://api.wordpress.org/plugins/info/1.0/' + p + '.json' )
                arrUrls.push( 'https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]=' + p )
            }
            service.getAllData(arrUrls).then( resp => { 
                store.addPlugins(resp)
            })
            .catch( e => { 
                console.log(e) 
            })
        },
        getTheme(theme) {
            axios
                .post('/api/wordpress/theme', {
                    theme: theme
                })
                .then(response => {
                    store.addTheme(response.data.data)
                    this.getThemeScreenshot(theme)
                } )
                .catch(error => console.log( error.response ) )              
        },
        getThemeScreenshot(theme) {
            axios
                .post('/api/wordpress/themeScreenshot', {
                    theme: theme
                })
                .then(response => {
                    console.log(response.data.data)
                } )
                .catch(error => console.log( error.response ) )              
        },
        getApps(target) {
            //console.log(target)
            axios
                .post('/api/apps', {
                    target: target
                })
                .then(response => {
                    store.addApps(response.data.data)
                } )
                .catch(error => console.log( error.response ) )              
        }
    }
};
</script>

<style>
    h1 {
        color: green;
    }
</style>