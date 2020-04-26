<template>
<form v-on:submit.prevent>
    <div class="form-group">
        <label for="exampleInputEmail1">Insert website address</label>
        <div class="input-group mb-3">
            <input type="text" class="form-control" :class="{ 'is-invalid' : hasError }" placeholder="https://www.example.com" aria-label="Recipient's username" aria-describedby="basic-addon2" v-model="target" v-on:keyup.enter="validate(target)" @keydown.space.prevent>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" bnvb v-on:click="validate(target)">GO
                    <svg class="bi bi-chevron-double-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                      <path fill-rule="evenodd" d="M3.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L9.293 8 3.646 2.354a.5.5 0 010-.708z" clip-rule="evenodd"/>
                      <path fill-rule="evenodd" d="M7.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L13.293 8 7.646 2.354a.5.5 0 010-.708z" clip-rule="evenodd"/>
                    </svg>
                </button>
            </div>            
            <div class="invalid-feedback">
            Please insert a valid URL
            </div>
            <hr>
        </div>  
    </div>
    <spinner v-if="loading" />
</form>
</template>
<script>
import { store } from "@/store/themeStore.js";
import { plugin } from "@/store/pluginStore.js";
import EventBus from "@/event-bus.js";
import Spinner from "@/components/spinner.vue"

export default {
    data() {
        return {
            storeState : store,
            pluginState : plugin,
            target: '',
            hasError: false,
            loading: false
        };
    },
    methods: {
        validate(target){
            this.loading = true
            store.reset()
            plugin.reset()
            target.trim()

            EventBus.$emit( "reset" );

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
            this.hasError = false
            // first get site html
            axios
                .post('/api/wordpress/scan', {
                    target: target
                })
                .then(response => {

                    this.loading = false
                    document.getElementById('report').scrollIntoView();

                    let data = response.data.data

                    EventBus.$emit("scanned-site",  data );

                    // log this
                    axios
                        .post('/api/site', data)
                    
                    /*if( data.plugins !== undefined ){
                        plugin.getAllData( data )
                    }else{
                        plugin.state.noPlugins = true
                        plugin.finish()
                    }*/

                    /*if( data.theme !== undefined ){
                        store.getTheme( data.theme )  
                    }else{
                        store.setNoTheme()
                    }*/
                } )
                .catch(error => {
                    console.log( error )
                } )
                .then( () => {
                    // always executed
                    //this.loading = false
                });             
        }
    },
    components: {
      Spinner
    }
}
</script>