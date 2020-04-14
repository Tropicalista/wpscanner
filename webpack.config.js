const elixir 	= require( "coldbox-elixir" );
const webpack 	= require( "webpack" );
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

elixir.config.mergeConfig({
    plugins: [
	    new BundleAnalyzerPlugin(),
        // globally scoped items which need to be available in all templates
        new webpack.ProvidePlugin({
			$              : "jquery",
			jQuery         : "jquery",
			"window.jQuery": "jquery",
			"window.$"     : "jquery",
            "Vue"          : ["vue/dist/vue.esm.js", "default"],
            "window.Vue"   : ["vue/dist/vue.esm.js", "default"]
        })
    ]
});
/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your ColdBox application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

module.exports = elixir( function( mix ) {
	// Mix App styles
	mix.sass( "app.scss" )
		// Mix JS and VueJS components
		.vue( "app.js" );
    mix.modules();
} );