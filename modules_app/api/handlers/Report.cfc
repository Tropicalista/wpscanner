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
				structDelete( data, "template" );
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

			// some clean up
			if( structKeyExists( p, 'notFound' ) ){
				var data = getInstance("Plugin@admin").getMemento();
				data.slug = p.slug;
				structAppend( p, data, true );
			}
			if( structKeyExists( p, 'name' ) ){
				p.name = DecodeForHTML( p.name );
			}
			if( structKeyExists( p, 'author' ) ){
				p.author = reReplaceNoCase( p.author, "<[^>]*>", "", "All" );
			}
			if( structKeyExists( p, 'sections' ) ){
				p.description = Left( reReplaceNoCase( DecodeForHTML( p.sections.description ), "<[^>]*>", "", "All" ), 500);
			}
			if( structKeyExists( p, 'banners' ) ){
				if( isArray( p.banners ) ){
					p.screenshot = "";
				}else{
					p.screenshot = structKeyExists( p.banners, 'low' ) ? p.banners.low : "";	
				}
			}else{
				p.screenshot = "";
			}
			if( structKeyExists( p, 'name' ) ){
				p.repository = "wordpress";
			}
			if( structKeyExists( rc, 'baseUrl' ) ){
				p.lastFoundOn = rc.baseUrl;
			}
			p.hits = query.raw( "hits + 1" );
			p.updatedDate = Now() //{ value = now(), cfsqltype = "CF_SQL_TIMESTAMP" }

			getInstance("Plugin@admin").where( 'slug', p.slug ).updateOrInsert( {
				slug = p.slug,
				name = p.name,
				author = p.author,
				homepage = p.homepage,
				description = p.description,
				screenshot = p.screenshot,
				repository = p.repository,
				lastFoundOn = p.lastFoundOn,
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
