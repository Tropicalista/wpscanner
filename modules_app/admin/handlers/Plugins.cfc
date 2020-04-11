component secured {

    property name="inertia" inject="Inertia@cbInertia";
    property name="query" inject="QueryBuilder@qb";

    function new( event, rc, prc ) {
        var plugin = getInstance("Plugin@admin");

        inertia.render( "Plugins/Edit", {
            "plugin": plugin.getMemento()
        } );
    }

    function index( event, rc, prc ) {

        event.paramValue( "page", 1 );
        event.paramValue( "orderBy", "createdDate" );
        event.paramValue( "sortOrder", "desc" );
        event.paramValue( "search", "" );

        if( len( rc.search ) ){
            var plugins = query.from( "plugins" )
                                .where( 'slug', "LIKE", "%#rc.search#%" )
                                .orWhere( 'name', "LIKE", "%#rc.search#%" )
                                .paginate( rc.page, 10 )
        }else{
            var plugins = query.from( "plugins" )
                                .orderBy( rc.orderBy, rc.sortOrder )
                                .paginate( rc.page, 10 );
        }

        inertia.render( "Plugins/Index", {
            "plugins": {
                data = plugins.results,
                pagination = plugins.pagination
            },
            filters = {
                search = rc.search,
                orderBy = rc.orderBy
            }
        } );


    }

    function create( event, rc, prc ) {
        var plugin = getInstance("Plugin@admin");

        var data = validate( target = rc, constraints = {
            "slug": { "required": true }
        } );

        if ( data.hasErrors() ) {
            flash.put( "errors", data.getAllErrorsAsStruct() );
            relocate( uri = "/admin/plugins/new" );
            return;
        }

        plugin.create( event.getExcept( ["last_url","event"] ) );

        relocate( uri = "/admin/plugins", statusCode = 303 );
    }

    function edit( event, rc, prc ) {
        var plugin = getInstance("Plugin@admin")
                        .with( "provider" )
                        .findOrFail( rc.id );

        var providers = getInstance("Provider@admin")
                            .all()
                            .map( function( provider ){ return provider.getMemento(); } );   

        inertia.render( "Plugins/Edit", {
            "plugin": plugin.getMemento(),
            "providers": providers
        } );
    }

    function update( event, rc, prc ) {
        var plugin = getInstance("Plugin@admin").findOrFail( rc.id );
        var provider = getInstance("Provider@admin").findOrFail( rc.provider );


        plugin.update( event.getExcept( ["last_url","event","provider"] ) );
        plugin.provider().associate(provider);

        relocate( uri = "/admin/plugins/#rc.id#/edit", statusCode = 303 );
    }

    function delete( event, rc, prc ) {
        getInstance("Plugin@admin").findOrFail( rc.id ).delete();

        relocate( uri = "/admin/plugins", statusCode = 303 );
    }

}
