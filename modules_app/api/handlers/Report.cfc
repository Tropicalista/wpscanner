/**
 * A ColdBox Event Handler
 */
component{

	property name="urlParser" inject="UrlParser";
	property name="query" inject="QueryBuilder@qb";
    property name="hyper" inject="HyperBuilder@Hyper";

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
		for( t in rc.theme ){
			arrayAppend( slugs, t.slug );
			//if( ! findNoCase( "-child", t.slug ) ){

				getInstance("Theme@admin")
					.where( 'slug', t.slug )
					.updateOrInsert({
						slug = t.slug,
						author = t.author,
						author_uri = t.author_uri,
						version = t.version,
						description = t.description,
						license = t.license,
						screenshot = t.screenshot,
						tags = t.tags,
						theme_name = t.theme_name,
						hits = query.raw( "hits + 1" ),
						theme_uri = t.theme_uri
				});

			//}

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
		var res = {}
		var parsed = urlParser.parse( rc.target );
		res.ip = CreateObject("java", "java.net.InetAddress").getByName( parsed.host ).getHostAddress();
		structAppend( res, parsed);
		var req = hyper.setMethod( "GET" )
			.setUrl( "https://ipapi.co/" & res.ip & "/json/" )
			.send();

		if( req.isSuccess() ){
			res.geoIP = deserializeJSON( req.getData() );
		}

		return res;
	}

}
