component {

    function up( schema, query ) {
        schema.create( "users", function( table ) {
            table.increments( "id" );
            table.string( "username" ).unique();
            table.string( "email" ).unique();
            table.string( "password" );
            table.timestamp( "createdDate" );
            table.timestamp( "updatedDate" );
        } );
    }

    function down( schema, query ) {
        schema.drop( "users" );      
    }

}