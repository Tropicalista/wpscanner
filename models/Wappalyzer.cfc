component{

	property name="scanner" inject="Scanner";
	
	/**
	 * Constructor
	 */
	function init(){
		
		return this;
	}
	
	/**
	 * Perform a wappalyzer action. It needs a valid url with protocol
	 */
	function check( required string myUrl ){
		var target = scanner.sanitizeUrl( arguments.myUrl );

		var basePath = expandPath("./");

		cfexecute( name="node" arguments="#basePath#resources\assets\js\wappalyzer #target#" variable="result" errorVariable = "errors" timeout="10" );

		return DeserializeJSON(result);
	}

}