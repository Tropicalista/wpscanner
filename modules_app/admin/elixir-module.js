const elixir = require("coldbox-elixir");

elixir.config.mergeConfig( {
    optimization: {
        splitChunks: {
            cacheGroups: {
                shared: {
                    chunks: "async",
                    minChunks: 2,
                    name: "modules_app/admin/includes/js/pages/shared"
                }
            }
        }
    }
} );

module.exports = mix => {
    mix.css("admin.css");
    mix.vue("admin.js");
};