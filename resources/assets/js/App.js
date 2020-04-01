import "bootstrap";
const axios = require('axios').default;

window.Vue = require( 'vue' );
window.axios = axios

import Hola from './components/Hola.vue';
import Checker from './components/Checker.vue';

new Vue( {
    el : '#app',

    components : { Hola, Checker },

    mounted : function() {
        if ( Vue.config.devtools && console.log ) {
            console.log( 'ColdBox, Vue and Vueify all set to go!' );
            console.log( "Vue Version " + Vue.version );
        }
    }
} );
