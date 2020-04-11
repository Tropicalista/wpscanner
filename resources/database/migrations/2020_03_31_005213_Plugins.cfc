component {
    
    function up( schema, query ) {
        schema.create( "plugins", function( table ) {
            table.increments( "id" );
            table.string( "slug" ).unique();
            table.string( "name" ).nullable();
            table.string( "author" ).nullable();
            table.string( "author_uri" ).nullable();
            table.string( "download_link" ).nullable();
            table.string( "homepage" ).nullable();
            table.text( "description" ).nullable();
            table.string( "screenshot" ).nullable();
            table.string( "referral_url" ).nullable();
            table.integer( "hits" ).default( 1 );
            table.string( "lastFoundOn" ).nullable();
            table.string( "repository" ).nullable();
            table.timestamp( "createdDate" );
            table.timestamp( "updatedDate" );
            table.unsignedInteger( "provider_id" ).nullable().references( "id" ).onTable( "providers" );
        } );        
    }

    function down( schema, query ) {
        schema.drop( "plugins" );              
    }

}