<template>
    <div class="col-md-4 offset-md-4">
        <h2>PLugins</h2>
        <ul>
            <li v-for="p in storeState.plugins">
                <img :src="p.banners.low">
                {{p.name}}
            </li>
        </ul>
    </div>
</template>
<script>
import { store } from "@/store/simpleStore.js";

export default {
    data() {
        return {
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