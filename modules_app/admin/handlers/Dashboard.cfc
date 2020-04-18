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

    function backup(event,rc,prc){
        var data = {};
        cfdbinfo( name="tables", type="tables", datasource="wpscan" );

        for( t in tables ){
           getData = QueryExecute(("SELECT * FROM #t.table_name#"), {}, {datasource="wpscan"});
           data[ #t.table_name# ] = getData;
        }

        cfwddx( action="cfml2wddx", input="#data#", output="packet" );

        var zfile = expandPath("./data.zip");

        cfzip( action="zip", file="#zfile#", overwrite="true" ){
            cfzipparam( content="#packet#", entrypath="data.packet" );
        }

        dump( data.themes );
        abort;
        //dump(rc.lastChecked);
        event.setView( "main/template" );
    }

}
