component {

    function up( schema, query ) {
        schema.create( "sites", function( table ) {
            table.increments( "id" );
            table.string( "url" ).unique();
            table.string( "ip" );
            table.string( "theme_slug" );
            table.json( "theme_css" );
            table.json( "plugins" );
            table.json( "headers" );
            table.json( "applications" );
            table.timestamp( "createdDate" );
            table.timestamp( "updatedDate" );
        } );
    }

    function down( schema, query ) {
        schema.drop( "sites" );      
    }

}