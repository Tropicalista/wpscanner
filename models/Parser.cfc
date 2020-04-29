component {

	/**
	 * init
	 */
	function init(){
		variables.jSoup = createObject( "java", "org.jsoup.Jsoup" )
		return this;
	}

	/**
	 * parse
	 */
	function getPaths( required string dom, baseUrl ){
		var dom = jSoup.parse( dom );
		if( len( arguments.baseUrl ) ){
			dom.setBaseUri( arguments.baseUrl )
		}		
		dump(dom.baseUri())
		var css = dom.getElementsByTag("link");
		var js = dom.getElementsByTag("script");

		var cssPaths = css.map( (css) => {
			dump(css.absUrl("href"))
			dump(css.attr("href").toString())
			return css.absUrl("href").toString() ?: "" 
		})
		var scriptPaths = js.map( (script) => {
			return len(script.absUrl("src").toString()) ? script.absUrl("src").toString() : ""
		}).filter( (p) => {
			return len(p)
		})
dump(scriptPaths)
dump(cssPaths)
abort;
		// some themes can be hided by cache, search elsewhere
		var more = reMatchNoCase( "/wp-content/themes/(.*?)(?=/)", arguments.dom );

		var additionalPaths = ArrayMerge( cssPaths, more );

		var paths = arrayMerge( scriptPaths, additionalPaths );

		return paths;
	}

	/**
	 * getPluginSlugs
	 */
	function getSlugs( required array paths, required string type ){
		var regex = ".*/wp-content\/" & arguments.type & "\/";
		var res = paths
		.filter( (p) => {
			return reFindNoCase( regex, p )
		})
		.map( ( p ) => {
			var res = reReplace( p, regex, "", "ALL" )
			return listFirst( res, "/" );
		} )
		return listToArray( listRemoveDuplicates( arrayToList( res ) ) );
	}

}