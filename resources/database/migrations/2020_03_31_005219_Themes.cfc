component {
    
    function up( schema, query ) {
        schema.create( "themes", function( table ) {
            table.increments( "id" );
            table.string( "slug" ).unique();
            table.string( "name" );
            table.string( "author" );
            table.string( "author_uri" );
            table.string( "theme_uri" );
            table.text( "description" );
            table.text( "tags" );
            table.string( "screenshot" );
            table.string( "license" ).nullable();
            table.integer( "hits" ).default( 1 );
            table.string( "referral_url" ).nullable();
            table.string( "repository" ).nullable();
            table.timestamp( "createdDate" );
            table.timestamp( "updatedDate" );
            table.unsignedInteger( "provider_id" ).nullable().references( "id" ).onTable( "providers" );
        } );        
    }

    function down( schema, query ) {
        schema.drop( "themes" );              
    }

}
