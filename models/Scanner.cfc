/**
 * My Hint
 */
component accessors="true"{

    property name="hyper" inject="HyperBuilder@Hyper";
    property name="parser" inject="UrlParser";
	
	/**
	 * Constructor
	 */
	function init(){
		
		return this;
	}
	
	/**
	 * Makes an HTTP request and return hyper object
	 */
	function makeRequest( required string myUrl ){
		var res = hyper.get( arguments.myUrl );

		return res;
	}

	/**
	 * If there's no protocol add default one
	 */
	function sanitizeUrl( required myUrl ){
		var domain = parser.isValid(arguments.myUrl);
		dump(domain);
		abort;
		var protocol = rematch( "^(?:https?:)?(?:\/\/)", arguments.myUrl );
		if( !len( protocol ) ){
			arguments.myUrl = "http://" & arguments.myUrl;
		}
		if( !isValidUrl( arguments.myUrl) ){
			throw( "Invalid URL" );
		}

		return arguments.myUrl;
	}

	/**
	 * Validate URL
	 */
	function isValidUrl( required myUrl ){
		// check to see if has an extension, we don't validate localhost
		if( !hasExtension( arguments.myUrl ) ){
			throw( "Invalid URL" );
		}
		return len( reMatchNoCase( "^https?://([^\/:]+)[\w\W]*$", arguments.myUrl ) ) ? true : false;
	}

	/**
	 * Check if url provided has an extension
	 */
	function hasExtension( required myUrl ){
		return find( ".", arguments.myUrl );
	}

	/**
	 * get Theme file
	 */
	function getTheme( required string style ){
		
		var req = makeRequest( arguments.style );

		if( req.isSuccess() ){

			var props = ["Theme Name", "Theme URI", "Author", "Author URI", "Description", "Version", "Tags", "Template", "License", "Text Domain"];

			var body = req.getData();
			var theme = {};

			for( p in props ){
				theme[p] = getThemeInfo( p , body );
			}
			return theme;
		}

		return;
	}

	/**
	 * get Theme Infos
	 */
	function getThemeInfo( required string info, required string body ){

		var r = arguments.info & "\s?:\s?[^\n\r]+";

		var res = reMatchNoCase( r, arguments.body );

		res = res.len() ? res[1] : "";

		return trim(reReplace( res, arguments.info & "\s?:", "" ));
	}

}
