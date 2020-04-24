component{

    function configure(){
		post( "ip", "report.getIp" );
		post( "validate", "home.validate" );
		post( "apps", "home.apps" );
		route( "wordpress/scan", "home.scan" ); // pass a site url and get theme
		post( "wordpress/theme", "home.theme" ); // pass a stylesheet url and get theme
		route( "wordpress/themeScreenshot", "home.themeScreenshot" ); // pass a stylesheet url and get theme
		post( "themeFromDB", "report.themeFromDB" ); // pass a stylesheet url and get theme
        post( "site", "report.index" );
        post( "plugins", "report.plugins" );
        get( "plugins", "report.plugins" );
		route( ":handler/:action?" ).end();
    }

}
