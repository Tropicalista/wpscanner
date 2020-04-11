component {

    property name="inertia" inject="Inertia@cbInertia";
    property name="auth" inject="AuthenticationService@cbauth";

    function new( event, rc, prc ) {
        inertia.render( "Auth/Login" );
    }

    function create( event, rc, prc ) {
        var result = validate( target = rc, constraints = {
            "email": { "required": "true", "type": "email" },
            "password": { "required": "true" },
            "remember": { "type": "boolean" }
        } );

        if ( result.hasErrors() ) {
            flash.put( "errors", result.getAllErrorsAsStruct() );
            relocate( uri = "/admin/login" );
            return;
        }

        try {
            auth.authenticate( rc.email, rc.password );
            relocate( uri = "/admin" );
        } catch ( InvalidCredentials e ) {
            flash.put( "errors", {
                email = [
                    { message = e.message }
                ]
            } );
            relocate( uri = "/admin/login" );
            return;
        }
    }

    function destroy( event, rc, prc ) secured {
        auth.logout();
        relocate( uri = "/admin/login" );
    }

}
