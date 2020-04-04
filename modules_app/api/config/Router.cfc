component{

    function configure(){
		post( "/validate", "home.validate" );
		post( "/apps", "home.getApps" );
		route( "/wordpress/scan", "home.scan" ); // pass a site url and get theme
		route( "/wordpress/theme", "home.getTheme" ); // pass a stylesheet url and get theme
		route( "/wordpress/themeScreenshot", "home.getThemeScreenshot" ); // pass a stylesheet url and get theme
		route( ":handler/:action?" ).end();
    }

}
