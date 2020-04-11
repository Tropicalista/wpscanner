component {

    function up( schema, query ) {
        schema.create( "providers", function( table ) {
            table.increments( "id" );
            table.string( "name" ).unique();
            table.string( "description" ).nullable();
            table.string( "url" ).nullable();
            table.string( "screenshot" ).nullable();
        } );
    }

    function down( schema, query ) {
        schema.drop( "providers" );      
    }

}
