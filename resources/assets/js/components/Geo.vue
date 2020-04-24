<template>
<div v-if="storeState.finished" class="mb-5">
    <div v-if="storeState.geo" class="row mb-5">
        <div class="col-md-6">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">#</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="(item, index) in storeState.geo.geoIP">
                  <td>{{index}}</td>
                  <td>{{item}}</td>
                </tr>
              </tbody>
            </table>
        </div>
        <div class="col-md-6">
            <span class="badge mr-5 badge-secondary" v-for="p in storeState.apps.applications">{{p.name}}</span>
        </div>
    </div>
</div>

</template>
<script>
import { store } from "@/store/themeStore.js";

export default {
    data() {
        return {
            storeState: store.state
        };
    }
};
</script>