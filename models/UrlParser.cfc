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
	 */
	function isValid( required string aUrl ){

		try{
			parser.init( arguments.aUrl );
		}
		catch( any e ){
			return false;
		}
		return true;
	}

	/**
	 * is a valid Url?
	 */
	function hasProtocol( required string aUrl ){

		try{
			parser.init( arguments.aUrl );
		}
		catch( any e ){
			throw("Not valid");
		}
	
	}

}
