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
    <div class="loader" style="min-height:50px">
        <div class="lds-facebook" v-if="loading && !storeState.finished && !pluginState.finished"><div></div><div></div><div></div></div>
    </div>
</form>
</template>
<script>
import { store } from "@/store/themeStore.js";
import { plugin } from "@/store/pluginStore.js";

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
            plugin.reset()
            target.trim()
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
            // first get site html
            axios
                .post('/api/wordpress/scan', {
                    target: target
                })
                .then(response => {

                    console.log(response)  
                    let data = response.data.data

                    // log this
                    axios
                        .post('/api/site', data)
                    
                    if( data.plugins !== undefined ){
                        plugin.getAllData( data )
                    }else{
                        plugin.state.noPlugins = true
                        plugin.finish()
                    }

                    if( data.theme !== undefined ){
                        store.getTheme( data.theme )  
                    }else{
                        store.setNoTheme()
                    }
                    this.getIp( data.baseUrl )
                    //this.getApps( data.baseUrl )
                } )
                .catch(error => {
                    console.log( error )
                } )
                .then( () => {
                    // always executed
                    this.loading = false
                });             
        },
        getThemeScreenshot(theme) {
            axios
                .post('/api/wordpress/themeScreenshot', {
                    theme: theme
                })
                .then(response => {
                    //console.log(response.data.data)
                } )
                .catch(error => console.log( error.response ) )              
        },
        getApps(target) {
            ////console.log(target)
            axios
                .post('/api/apps', {
                    target: target
                })
                .then(response => {
                    store.addApps(response.data.data)
                } )
                .catch(error => console.log( error.response ) )              
        },
        getIp(target) {
            ////console.log(target)
            axios
                .post('api/ip', {
                    target: target
                })
                .then(response => {
                    store.addGeo(response.data)
                } )
                .catch(error => console.log( error.response ) )              
        }
    }
};
</script>

<style>
.loader {
    display: block;
    text-align: center;
}
.lds-facebook {
  display: inline-block;
  position: relative;
  width: 40px;
  height: 40px;
}
.lds-facebook div {
  display: inline-block;
  position: absolute;
  left: 8px;
  width: 16px;
  background: #007bff;
  animation: lds-facebook 1.2s cubic-bezier(0, 0.5, 0.5, 1) infinite;
}
.lds-facebook div:nth-child(1) {
  left: 8px;
  animation-delay: -0.24s;
}
.lds-facebook div:nth-child(2) {
  left: 32px;
  animation-delay: -0.12s;
}
.lds-facebook div:nth-child(3) {
  left: 56px;
  animation-delay: 0;
}
@keyframes lds-facebook {
  0% {
    top: 8px;
    height: 64px;
  }
  50%, 100% {
    top: 24px;
    height: 32px;
  }
}

</style>