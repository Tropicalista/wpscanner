component{

	function configure(){

        route( "login" )
            .withHandler( "sessions" )
            .toAction( {
                "GET": "new",
                "POST": "create"
            } );

        post( "logout", "sessions.destroy" );
        
        resources( "site" );
        get( "reports", "dashboard.reports" );

        get( "providers/:id/edit", "providers.edit" );
        resources( "providers" );

        get( "plugins/:id/edit", "plugins.edit" );
        resources( "plugins" );

        get( "themes/:id/edit", "themes.edit" );
        resources( "themes" );

        route( "/" ).to( "dashboard.index" );

        route( "profile" )
            .withHandler( "profile" )
            .toAction( {
                "GET": "index",
                "PUT": "update"
            } );

        route( "/users/:user/restore" ).to( "users.restore" );

        route( "/:handler/:action?" ).end();

	}

}