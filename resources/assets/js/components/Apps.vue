<template>
    <div class="col-md-4 offset-md-4">
        <h2>Apps</h2>
        <ul>
            <li v-for="p in storeState.apps.applications">{{p}}</li>
        </ul>
    </div>
</template>
<script>
import { store } from "@/store/simpleStore.js";

export default {
    data() {
        return {
            name: 'Mr ColdBox',
            storeState: store.state
        };
    }
};
</script>

<style>
    h1 {
        color: green;
    }
</style>