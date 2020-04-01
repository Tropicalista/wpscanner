component{
	
	property name="parsedUrl";

	/**
	 * Constructor
	 */
	function init(){
		return this;
	}
	
	/**
	 * Parser
	 */
	function parse( required string aDomain ){
		var domain = createObject( "java", "com.google.common.net.InternetDomainName" ).from( aDomain );

		return domain;
	}
	
}