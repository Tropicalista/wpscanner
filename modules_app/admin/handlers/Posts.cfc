component secured {

    property name="inertia" inject="Inertia@cbInertia";
    property name="query" inject="QueryBuilder@qb";

    function new( event, rc, prc ) {
        var post = getInstance("Post@admin");

        inertia.render( "Posts/Edit", {
            "post": post.getMemento()
        } );
    }

    function index( event, rc, prc ) {

        event.paramValue( "page", 1 );
        event.paramValue( "orderBy", "createdDate" );
        event.paramValue( "sortOrder", "desc" );
        event.paramValue( "search", "" );

        if( len( rc.search ) ){
            var posts = query.from( "posts" )
                                .where( 'slug', "LIKE", "%#rc.search#%" )
                                .orWhere( 'title', "LIKE", "%#rc.search#%" )
                                .paginate( rc.page, 10 )
        }else{
            var posts = query.from( "posts" )
                                .orderBy( rc.orderBy, rc.sortOrder )
                                .paginate( rc.page, 10 );
        }

        inertia.render( "Posts/Index", {
            "posts": {
                data = posts.results,
                pagination = posts.pagination
            },
            filters = {
                search = rc.search,
                orderBy = rc.orderBy
            }
        } );


    }

    function create( event, rc, prc ) {
        var post = getInstance("Post@admin");

        var data = validate( target = rc, constraints = {
            "slug": { "required": true }
        } );

        if ( data.hasErrors() ) {
            flash.put( "errors", data.getAllErrorsAsStruct() );
            relocate( uri = "/admin/posts/new" );
            return;
        }

        post.create( event.getExcept( ["last_url","event"] ) );

        relocate( uri = "/admin/posts", statusCode = 303 );
    }

    function edit( event, rc, prc ) {
        var post = getInstance("Post@admin")
                        .with( "provider" )
                        .findOrFail( rc.id );

        var providers = getInstance("Provider@admin")
                            .all()
                            .map( function( provider ){ return provider.getMemento(); } );   

        inertia.render( "Posts/Edit", {
            "post": post.getMemento(),
            "providers": providers
        } );
    }

    function update( event, rc, prc ) {
        var post = getInstance("Post@admin").findOrFail( rc.id );
        var provider = getInstance("Provider@admin").findOrFail( rc.provider );


        post.update( event.getExcept( ["last_url","event","provider"] ) );
        post.provider().associate(provider);

        relocate( uri = "/admin/posts/#rc.id#/edit", statusCode = 303 );
    }

    function delete( event, rc, prc ) {
        getInstance("Post@admin").findOrFail( rc.id ).delete();

        relocate( uri = "/admin/posts", statusCode = 303 );
    }

}
