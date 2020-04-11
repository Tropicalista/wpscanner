import "bootstrap";
const axios = require('axios').default;

window.Vue = require( 'vue' );
window.axios = axios

import Apps from './components/Apps.vue';
import Theme from './components/Theme.vue';
import Checker from './components/Checker.vue';
import Plugins from './components/Plugins.vue';

import './filters/firstDot.js'
import './filters/truncate.js'

new Vue( {
    el : '#app',

    components : { Theme, Checker, Plugins, Apps },

    mounted : function() {
        if ( Vue.config.devtools && console.log ) {
            console.log( 'ColdBox, Vue and Vueify all set to go!' );
            console.log( "Vue Version " + Vue.version );
        }
    }
} );
