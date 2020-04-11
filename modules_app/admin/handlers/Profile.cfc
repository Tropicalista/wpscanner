component secured {

    property name="inertia" inject="Inertia@cbInertia";

    function index( event, rc, prc ) {
        var user = auth().user();
        inertia.render( "Profile/Edit", {
            "user": {
                "id": user.getId(),
                "first_name": user.getFirstName(),
                "last_name": user.getLastName(),
                "email": user.getEmail()
            }
        } );
    }

    function update( event, rc, prc ) {
        var user = auth().user();
        var data = validateOrFail( target = rc, constraints = {
            "first_name": { "required": true, "size": "1..50" },
            "last_name": { "required": true, "size": "1..50" },
            "email": { "required": true, "size": "1..50", "type": "email" }, // add unique rule
            "password": { "required": false }
        } );

        user.update( event.getOnly( [ "first_name", "last_name", "email" ] ) );

        if ( event.valueExists( "password" ) ) {
            user.update( { "password": rc.password } );
        }

        relocate( uri = "/admin/profile", statusCode = 303 );
    }

    function delete( event, rc, prc ) {
        auth().user().findOrFail( rc.id ).delete();

        relocate( uri = "/admin/profile", statusCode = 303 );
    }

}
