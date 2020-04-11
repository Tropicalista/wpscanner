component {

    function up( schema, query ) {
        query.newQuery().table( "users" ).insert( {
            "first_name": "John",
            "last_name": "Doe",
            "email": "johndoe@example.com",
            "password": "$2a$12$1VHpVoEg525gaEhhMjWrMuCJS3hZ2VPhL6roHhWv8uN/8IgfaYQBq",
            "remember_token": "ashn4wior1",
            "owner": 1
        } );
    }

    function down( schema, query ) {

    }

}
