component secured {

    this.prehandler_only = "create,update";

    property name="inertia" inject="Inertia@cbInertia";
    property name="query" inject="QueryBuilder@qb";

    function preHandler(){
        prc.dataValidation = validate( target = rc, constraints = {
            "slug": { "required": true }
        } );       
    }

    function new( event, rc, prc ) {
        var theme = getInstance("Theme@admin");

        inertia.render( "Themes/Edit", {
            "theme": theme.getMemento()
        } );
    }

    function index( event, rc, prc ) {

        event.paramValue( "page", 1 );
        event.paramValue( "orderBy", "createdDate" );
        event.paramValue( "sortOrder", "desc" );
        event.paramValue( "search", "" );

        if( len( rc.search ) ){
            var themes = query.from( "themes" )
                                .where( 'slug', "LIKE", "%#rc.search#%" )
                                .orWhere( 'name', "LIKE", "%#rc.search#%" )
                                .paginate( rc.page, 10 )
        }else{
            var themes = query.from( "themes" )
                                .orderBy( rc.orderBy, rc.sortOrder )
                                .paginate( rc.page, 10 );
        }

        inertia.render( "Themes/Index", {
            "themes": {
                data = themes.results,
                pagination = themes.pagination
            },
            filters = {
                search = rc.search,
                orderBy = rc.orderBy
            }
        } );

    }

    function create( event, rc, prc ) {
        var theme = getInstance("Theme@admin");

        if ( prc.dataValidation.hasErrors() ) {
            flash.put( "errors", prc.dataValidation.getAllErrorsAsStruct() );
            relocate( uri = "/admin/themes/new" );
            return;
        }

        theme.create( event.getExcept( ["last_url","event"] ) );
        flash.put( "success", { success = "Theme Created!" } );

        relocate( uri = "/admin/themes", statusCode = 303 );
    }

    function edit( event, rc, prc ) {
        var theme = getInstance("Theme@admin").findOrFail( rc.id );

        var providers = getInstance("Provider@admin")
                            .all()
                            .map( function( provider ){ return provider.getMemento(); } );   

        inertia.render( "Themes/Edit", {
            "theme": theme.getMemento(),
            "providers": providers
        } );
    }

    function update( event, rc, prc ) {
        var theme = getInstance("Theme@admin").findOrFail( rc.id );
        if ( prc.dataValidation.hasErrors() ) {
            flash.put( "errors", prc.dataValidation.getAllErrorsAsStruct() );
            relocate( uri = "/admin/themes/#rc.id#/edit", statusCode = 303 );
            return;
        } 

        theme.update( event.getExcept( ["last_url","event"] ) );
        if( ! isNull( rc.provider ) ){
            var provider = getInstance("Provider@admin").find( rc.provider );
            plugin.provider().associate(provider);
        }

        flash.put( "success", { success = "Theme Updated!" } );

        relocate( uri = "/admin/themes/#rc.id#/edit", statusCode = 303 );
    }

    function delete( event, rc, prc ) {
        getInstance("Theme@admin").findOrFail( rc.id ).delete();

        relocate( uri = "/admin/themes", statusCode = 303 );
    }

}
