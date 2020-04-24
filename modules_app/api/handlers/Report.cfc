/**
 * A ColdBox Event Handler
 */
component{

	property name="query" inject="QueryBuilder@qb";
	property name="ipApi" inject="ipApi@api";

	/**
	 * Home page
	 */
	function index( event, rc, prc ){
		var site = getInstance("Site@admin")
			.where( 'url', rc.baseUrl  )
			.updateOrInsert({
				url = rc.baseUrl,
				plugins = structKeyExists( rc, 'plugins' ) ? serializeJson(rc.plugins) : "",
				themes = structKeyExists( rc, 'theme' ) ? serializeJson(rc.theme) : ""
		});		
		return { success = true };
	}

	/**
	 * Home page
	 */
	function themeFromDB( event, rc, prc ){

		var slugs = [];
		var res = [];

		for( t in rc.theme ){

			arrayAppend( slugs, t.slug );

			if( ! findNoCase( "-child", t.slug ) ){

				var data = t.filter( function(d){
					return len( t[d] )
				} )
				structDelete( data, "text_domain" );
				data.hits = query.raw( "hits + 1" )
				
				getInstance("Theme@admin")
					.where( 'slug', t.slug )
					.updateOrInsert( data )

			}

		}

		return getInstance( "Theme@admin" )
					.whereIn( 'slug', slugs )
					.get()
					.map( function( theme ){ return theme.getMemento(); } );   


	}

	function plugins( event, rc, prc ){
		var arr = [];

		for(p in rc.plugins){

			// set the link
			var link = structKeyExists( p, 'homepage' ) ? p.homepage : "";
			if( ! len( link ) ){
				link = structKeyExists( p, 'author' ) ? p.author : "";
			}

			getInstance("Plugin@admin").where( 'slug', p.slug ).updateOrInsert({
				slug = p.slug,
				name = structKeyExists( p, 'name' ) ? DecodeForHTML( p.name ): "",
				author = structKeyExists( p, 'author' ) ? reReplaceNoCase( p.author, "<[^>]*>", "", "All" ) : "",
				author_uri = link,
				homepage = structKeyExists( p, 'homepage' ) ? p.homepage : "",
				description = structKeyExists( p, 'sections' ) ? Left( reReplaceNoCase( DecodeForHTML( p.sections.description ), "<[^>]*>", "", "All" ), 500) : "",
				screenshot = ( structKeyExists( p, 'banners' ) AND !isArray( p.banners ) ) ? p.banners.low : "",
				repository = structKeyExists( p, 'name' ) ? "wordpress" : "",
				lastFoundOn = structKeyExists( rc, 'baseUrl' ) ? rc.baseUrl : "",
				hits = query.raw( "hits + 1" ),
				updatedDate = { value = now(), cfsqltype = "CF_SQL_TIMESTAMP" }
			});

		}	

		var plins = getInstance("Plugin@admin")
						.whereIn( 'slug', rc.slugs )
						.get();

		var plins = plins
		    .filter(function(p) {
		        return p.isChecked();
		    })

		for(p in plins){
			arrayAppend( arr, p.getMemento() );
		}

		return arr;

	}

	/**
	 * get Ip from domain
	 */
	function getIp( event, rc, prc ){
		var res = ipApi.getIp( rc.target );

		return res;
	}

	private function mergeStructs(required array structs) {
	    var base = {};
	    var len = arrayLen(arguments.structs);
	    for (var i = 1; i <= len; i = i + 1) {
	        for (key in arguments.structs[i]) base[lcase(key)]=arguments.structs[i][key];
	    }
	    return base;
	}

}
