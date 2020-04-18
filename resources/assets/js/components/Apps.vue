<template>
<div v-if="storeState.apps.length">
    <h2 class="pb-2">Apps</h2>
    <div class="mb-5">
        <span class="badge mr-5 badge-secondary" v-for="p in storeState.apps.applications">{{p.name}}</span>
    </div>
</div>
</template>
<script>
import { store } from "@/store/themeStore.js";

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