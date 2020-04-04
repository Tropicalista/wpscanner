/**
 * My Hint
 */
component accessors="true"{

    property name="hyper" inject="HyperBuilder@Hyper";
    property name="parser" inject="UrlParser";
    property name="domain" inject="DomainParser";
    property name="themeScanner" inject="ThemeScanner";
	
	/**
	 * Constructor
	 */
	function init(){
		
		return this;
	}
	
	/**
	 * Makes an HTTP request to a site and get a theme
	 */
	function getWpTheme( required string myUrl ){
		var theme = themeScanner.scan( arguments.myUrl )

		return theme;
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

		if( !parser.hasProtocol( arguments.myUrl ) ){
			// add the default one
			arguments.myUrl = "http://" & arguments.myUrl;
		}
		var parsedUrl = parser.parse( arguments.myUrl );
		
		if( !domain.hasPublicSuffix( parsedUrl.host ) ){
			throw( "Invalid URL" );
		}

		if( !parser.isValidUrl( arguments.myUrl) ){
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

}
