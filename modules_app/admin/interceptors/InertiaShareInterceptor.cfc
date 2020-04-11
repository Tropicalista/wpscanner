component {

    property name="inertia" inject="provider:Inertia@cbInertia";
    property name="auth" inject="provider:AuthenticationService@cbauth";

    function preProcess() {
        inertia.share( "auth", {
            "user": function() {
                return auth.check() ?
                    auth.user().getMemento() :
                    javacast( "null", "" );
            }
        } );
        inertia.share( "flash", function() {
            return flash.get( "success", {} );
        } );
        inertia.share( "errors", function() {
            return flash.get( "errors", {} );
        } );
    }

}