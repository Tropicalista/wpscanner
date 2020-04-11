component{

	function configure(){

		route( "/initialize", "home.initialize" );
		route( "/content", "home.content" );
		route( "/", "home.index" );

	}

}