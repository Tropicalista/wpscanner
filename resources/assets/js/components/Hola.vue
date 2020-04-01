<template>
    <div class="col-md-4 offset-md-4">
        <h1>Hola, {{ name }}! Stocazzo</h1>
        <h2>{{ storeState.numbers }}</h2>
        <input class="form-control" type="text" v-model="name">
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