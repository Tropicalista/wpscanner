<template>
<div v-if="storeState.finished" class="mb-5">
    <div v-if="storeState.geo" class="row mb-5">
        <div class="col-md-4">
            {{storeState.geo}}
        </div>
        <div class="col-md-8">
            Stocazzo
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