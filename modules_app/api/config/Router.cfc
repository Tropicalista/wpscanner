component{

    function configure(){
		route( "/wappalyzer", "home.index" );
		route( "/wordpress", "home.index" );
		route( ":handler/:action?" ).end();
    }

}
