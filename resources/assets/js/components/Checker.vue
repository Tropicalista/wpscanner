<template>
<form v-on:submit.prevent>
    <div class="form-group">
        <label for="exampleInputEmail1">Insert website address</label>
        <div class="input-group mb-3">
            <input type="text" class="form-control" :class="{ 'is-invalid' : hasError }" placeholder="Enter site Url" aria-label="Recipient's username" aria-describedby="basic-addon2" v-model="target" v-on:keyup.enter="validate(target)" @keydown.space.prevent>
            <div class="input-group-append">
                <button class="btn btn-primary" type="button" bnvb v-on:click="validate(target)">GO
                    <span v-if="loading" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                </button>
            </div>            
            <div class="invalid-feedback">
            Please insert a valid URL
            </div>
            <hr>
        </div>  
    </div>
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
            store.reset()
            if( !target.trim() ){
                this.hasError = true
                return
            }
            this.loading = true

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
                    this.loading = false
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