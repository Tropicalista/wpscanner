component secured {

    property name="inertia" inject="Inertia@cbInertia";
    property name="query" inject="QueryBuilder@qb";

    function new( event, rc, prc ) {
        var provider = getInstance("Provider@admin");

        inertia.render( "Providers/Edit", {
            "provider": provider.getMemento()
        } );
    }

    function index( event, rc, prc ) {

        event.paramValue( "page", 1 );
        event.paramValue( "orderBy", "name" );
        event.paramValue( "sortOrder", "desc" );
        event.paramValue( "search", "" );

        if( len( rc.search ) ){
            var providers = query.from( "providers" )
                                .where( 'url', "LIKE", "%#rc.search#%" )
                                .orWhere( 'name', "LIKE", "%#rc.search#%" )
                                .paginate( rc.page, 10 )
        }else{
            var providers = query.from( "providers" )
                                .orderBy( rc.orderBy, rc.sortOrder )
                                .paginate( rc.page, 10 );
        }

        inertia.render( "Providers/Index", {
            "providers": {
                data = providers.results,
                pagination = providers.pagination
            },
            filters = {
                search = rc.search,
                orderBy = rc.orderBy
            }
        } );


    }

    function create( event, rc, prc ) {
        var provider = getInstance("Provider@admin");

        var data = validate( target = rc, constraints = {
            "name": { "required": true }
        } );

        if ( data.hasErrors() ) {
            flash.put( "errors", data.getAllErrorsAsStruct() );
            relocate( uri = "/admin/providers/new" );
            return;
        }

        provider.create( event.getExcept( ["last_url","event"] ) );

        relocate( uri = "/admin/providers", statusCode = 303 );
    }

    function edit( event, rc, prc ) {
        var provider = getInstance("Provider@admin").findOrFail( rc.id );
        inertia.render( "Providers/Edit", {
            "provider": provider.getMemento()
        } );
    }

    function update( event, rc, prc ) {
        var provider = getInstance("Provider@admin").findOrFail( rc.id );

        provider.update( event.getExcept( ["last_url","event"] ) );

        relocate( uri = "/admin/providers/#rc.id#/edit", statusCode = 303 );
    }

    function delete( event, rc, prc ) {
        getInstance("Provider@admin").findOrFail( rc.id ).delete();

        relocate( uri = "/admin/providers", statusCode = 303 );
    }

}
