component{
	
	property name="parser";

	/**
	 * Constructor
	 */
	function init(){
		variables.parser = createObject( "java", "java.net.URL" );
		return this;
	}
	
	/**
	 * Parser
	 */
	function parse( required string aUrl ){
		parser.init( arguments.aUrl );
		parsedUrl.protocol = parser.getProtocol();
		parsedUrl.authority = parser.getAuthority();
		parsedUrl.host = parser.getHost();
		parsedUrl.port = parser.getPort();
		parsedUrl.path = parser.getPath();
		parsedUrl.query = parser.getQuery();
		parsedUrl.filename = parser.getFile();
		parsedUrl.ref = parser.getRef();

		return parsedUrl;
	}
	
	/**
	 * is a valid Url?
	 * @return boolean
	 */
	function isValidUrl( required string aUrl ){

		try{
			parser.init( arguments.aUrl );
		}
		catch( any e ){
			return false;
		}
		return true;
	}

	/**
	 * Has protocol?
	 * @return boolean
	 */
	function hasProtocol( required string aUrl ){

		if( len( reMatchNoCase( "^https?://", trim( arguments.aUrl ) ) ) ){
			return true;
		}
		return false;

	}

	/**
	 * get Protocol or fallback to default
	 * @return A valid protocol
	 */
	function getProtocol( required string aUrl ){

		if( hasProtocol( arguments.aUrl ) ){
			return parse( arguments.aUrl ).protocol;
		}
		// fallback to default one
		return "http";

	}

}
