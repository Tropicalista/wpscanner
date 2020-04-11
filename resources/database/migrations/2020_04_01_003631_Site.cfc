component {

    function up( schema, query ) {
        schema.create( "sites", function( table ) {
            table.increments( "id" );
            table.string( "url" ).unique();
            table.string( "ip" ).nullable();
            table.string( "theme_slug" ).nullable();
            table.json( "plugins" ).nullable();
            table.json( "themes" ).nullable();
            table.json( "headers" ).nullable();
            table.json( "apps" ).nullable();
            table.timestamp( "createdDate" );
            table.timestamp( "updatedDate" );
        } );
    }

    function down( schema, query ) {
        schema.drop( "sites" );      
    }

}