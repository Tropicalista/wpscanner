component secured {

    property name="inertia" inject="Inertia@cbInertia";

    function index( event, rc, prc ) {
        inertia.render( "Dashboard/Index" );
    }

    function reports( event, rc, prc ) {
        var sites = getInstance("Site@admin")
        					.all()
                            .map( function( report ){ return report.getMemento(); } );   
        
        inertia.render( "Reports/Index", {
            "sites": sites
        } );

    }

}
