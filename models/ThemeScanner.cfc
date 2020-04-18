/**
 * My Hint
 */
component accessors="true"{

    property name="hyper" inject="HyperBuilder@Hyper";
    property name="parser" inject="UrlParser";
    property name="domain" inject="DomainParser";
    property name="theme";
    property name="jSoup";
    property name="wpApi" default="https://api.wordpress.org";

	/**
	 * Constructor
	 */
	function init(){
		
		variables.jsoup = createObject( "java", "org.jsoup.Jsoup" );
		return this;
	}

	/**
	 * Parse a site to find stylesheet or slug
	 */
	function scan( required string aUrl ){
		
		var req = makeRequest( arguments.aUrl );
		var res = {
			baseUrl = req.getRequest().getFullUrl()
		};
		
		res.headers = req.getHeaders();

		if( req.isSuccess() ){

			// parse to get theme slug
			res.theme.baseUrl = req.getRequest().getFullUrl()
			res.theme.slug = getThemeSlug( req.getData() );
			res.theme.themePath = getCSSpath( req.getData() ); // try to get the path of the theme
			res.plugins = getPluginsSlug( req.getData() );

			return res;
		}

		return res;
	}

	/**
	 * Try to find a theme
	 *@details All theme details we have found(themepath and theme slugs)
	 */
	function getTheme( required struct details ){

		var themes = [];
		for( slug in arguments.details.slug ){
			var theme = {};
			theme.themeurl = buildThemeUrl( arguments.details, slug );
			theme.slug = slug
			arrayAppend( themes, theme );
		}

		var result = [];
		for( t in themes ){
			var temp = getThemeByStyle( t.themeurl & "/style.css", t.slug );
			temp.screenshot = getThemeScreenshot( t.themeurl );
			temp.slug = t.slug;
			arrayAppend( result, temp );
		}
		
		return result;
	}

	/**
	 * getThemeScreenshot
	 */
	function getThemeScreenshot( required string sUrl ){

		var screenshot = getScreenshotUrl( sUrl & "/screenshot.png" );

		if( len( screenshot ) ){
			return screenshot;
		}

		// otherwise try the jpg
		screenshot = getScreenshotUrl( sUrl & "/screenshot.jpg" );
		return screenshot;

	}

	/**
	 * getThemeScreenshot
	 */
	function getThemeScreenshots( required struct details ){

		var themeUrls = buildThemeUrl( arguments.details );
		var screenshots = [];
		// first try the png
		for( u in themeUrls ){
			arrayAppend( screenshots, getScreenshotUrl( u & "/screenshot.png" ) );
		}

		if( arrayLen( screenshots ) ){
			return screenshots;
		}

		// otherwise try the jpg
		for( u in themeUrls ){
			arrayAppend( screenshots, getScreenshotUrl( u & "/screenshot.jpg" ) );
		}
		return screenshots;

	}

	/**
	 * getScreenshotUrl
	 */
	function getScreenshotUrl( required string sUrl ){
	
		var req = hyper.setMethod( "HEAD" )
			.setUrl( sUrl )
			.send();

		if( req.isSuccess() ){
			return sUrl;
		}

		return "";
	}

	/**
	 * build base theme url
	 */
	function buildThemeUrl( required struct details, required string slug, boolean themePath = false ){

		// create a theme style path
		var stylePath = arguments.details.baseUrl & "/wp-content/themes/";		
		// if we have a themepath use it
		if( len( arguments.details.themePath ) AND arguments.themePath ){
			var stylePath = arguments.details.themePath;
		}

		return stylePath & arguments.slug;
	}

	/**
	 * get Theme file
	 * @styleUrl full path stylesheet
	 */
	function getThemeByStyle( required string styleUrl, slug ){
		
		var req = makeRequest( arguments.styleUrl );

		if( req.isSuccess() ){

			var props = ["Theme Name", "Theme URI", "Author", "Author URI", "Description", "Version", "Tags", "Template", "License", "Text Domain"];

			var content = req.getData();
			var theme = {};

			for( p in props ){
				theme[ lCase( replace( p, " ", "_" ) ) ] = getThemeInfo( p , content );
			}
			if( !( theme.theme_name.len() ) ){ theme.theme_name = arguments.slug[1] }
			return theme;
		}

		return {};
	}

	/**
	 * get Theme CSS path
	 * @body The http body response
	 */
	function getCSSpath( required string body ){
		var linkArr = reMatchNoCase("<link(.*?)/?>", arguments.body);
		var resArr = [];
		linkArr.each(function(a){
			var match = reMatchNoCase("href=['""].*\/themes\/", a);
			if( len(match) ){
				arrayAppend( resArr, reReplace( match[1], "href=['""']", "" ) );
			};
		})

		return arrayLen(resArr) ? resArr[1] : "";
	}

	/**
	 * get Plugins slugs
	 */
	function getPluginsSlug( required string body ){

		var dom = reMatchNoCase( "/plugins/(.*?)(?=/)", arguments.body );

		var list = listRemoveDuplicates( arrayToList( dom ) );
		var res = reReplace( list, "/plugins/", "", "ALL" )

		return listToArray( res );


	}

	/**
	 * get Theme slug by body request response
	 */
	function getThemeSlug( required string body ){

		var dom = reMatchNoCase( "/themes/(.*?)(?=/)", arguments.body );

		var list = listRemoveDuplicates( arrayToList( dom ) );
		var res = reReplace( list, "/themes/", "", "ALL" )

		return listToArray( res );

	}

	/**
	 * get Theme Infos
	 */
	function getThemeInfo( required string info, required string content ){

		var regex = arguments.info & "\s?:\s?[^\n\r]+";
		
		var res = reMatchNoCase( regex, arguments.content );
		res = res.len() ? res[1] : "";

        if ( res.len() > 800 AND !( FindNoCase( 'description', info ) ) ) return ""; 

		return trim( reReplaceNoCase( res, arguments.info & "\s?:", "" ) );
	}
	
	/**
	 * getPluginFromWp
	 */
	function getPluginFromWp( required string slug ){
		var req = makeRequest( wpApi & "/plugins/info/1.0/" & slug & ".json" );

		if( req.isSuccess() ){

			return req.getData();

		}

	}

	/**
	 * Makes an HTTP request and return hyper object
	 */
	function makeRequest( required string myUrl ){
		var headers = {};
		headers["User-Agent"] = "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.113 Safari/537.36";
		headers.referer = "http://wpscanner.net";
		headers["accept-language"] = "it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7,es;q=0.6";

		var res = hyper.setHeaders( headers ).get( arguments.myUrl );

		return res;
	}

}
