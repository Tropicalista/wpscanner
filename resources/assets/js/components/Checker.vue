<template>
    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="https://www.example.com" aria-label="Recipient's username" aria-describedby="basic-addon2" v-model="target">
        <div class="input-group-append">
            <button class="btn btn-primary" type="button" v-on:click="getApps(target)">Button</button>
        </div>
    </div>    
</template>
<script>
import { store } from "@/store/simpleStore.js";

export default {
    data() {
        return {
            target: ''
        };
    },
    methods: {
        getApps(target) {
            console.log(target)
            axios
                .post('/api/wappalyzer', {
                    target: target
                })
                .then(response => {
                    console.log(response.data)
                    store.addNumber(Number(1234))
                } )
              .catch(error => console.log( error ) )              
        }
    }
};
</script>

<style>
    h1 {
        color: green;
    }
</style>