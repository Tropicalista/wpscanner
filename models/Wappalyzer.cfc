/**
 * My Hint
 */
component accessors="true"{
	
	/**
	 * Constructor
	 */
	function init(){
		
		return this;
	}
	
	/**
	 * check
	 */
	function check( required string myUrl ){

		cfexecute( name="node" arguments="F:\Apps\WpScanner\resources\assets\js\wappalyzer #arguments.myUrl#" variable="result" errorVariable = "errors" timeout="10" );
		
		return result;
	}

}