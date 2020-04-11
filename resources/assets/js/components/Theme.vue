<template>
<div v-if="storeState.finished">
    <h2 class="pb-2">Themes</h2>
    <div class="alert alert-danger" role="alert" v-if="storeState.noTheme">
      No WordPress Theme found!
    </div>
    <div class="row mb-5" v-for="t in storeState.themes">
        <div class="col-md-4">
            <a :href="t.theme_uri" target="_blank">          
                <img :src="t.screenshot" class="img-fluid" v-if="t.theme_name">
                <svg v-else class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="##55595c"></rect><text x="50%" y="50%" fill="##eceeef" dy=".3em">Thumbnail</text></svg>
            </a>
        </div>
        <div class="col-md-8">
            <ul v-if="t.theme_name">
                <li><b>Title:</b> {{t.theme_name}}</li>
                <li><b>Description:</b> {{t.description | truncate }}</li>
                <li><b>Author:</b> {{t.author}}</li>
                <li><b>Version:</b> {{t.version}}</li>
                <li><b>Url:</b> <a :href="t.theme_uri" target="_blank">{{t.theme_uri}}</a></li>
            </ul>
            <h3 v-else>Cannot found a theme on this site, sorry!</h3>
        </div>
    </div>
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