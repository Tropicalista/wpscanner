component {

    function up( schema, query ) {
        schema.create( "posts", function( table ) {
            table.increments( "id" );
            table.string( "title" );
            table.string( "slug" ).unique();
            table.string( "content" );
            table.json( "meta_description" ).nullable();
            table.json( "meta_title" ).nullable();
            table.timestamp( "createdDate" );
            table.timestamp( "updatedDate" );
        } );
    }

    function down( schema, query ) {
        schema.drop( "posts" );      
    }

}