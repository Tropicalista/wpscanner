component {
    
    function up( schema, query ) {
        schema.create( "themes", function( table ) {
            table.increments( "id" );
            table.string( "slug" ).unique();
            table.string( "theme_name" ).nullable();
            table.string( "author" ).nullable();
            table.string( "author_uri" ).nullable();
            table.string( "version" ).nullable();
            table.string( "theme_uri" ).nullable();
            table.text( "description" ).nullable();
            table.text( "tags" ).nullable();
            table.string( "screenshot" ).nullable();
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
