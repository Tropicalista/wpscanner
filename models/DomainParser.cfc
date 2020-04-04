component{
	
	property name="domain";

	/**
	 * Constructor
	 */
	function init(){
		variables.domain = createObject( "java", "com.google.common.net.InternetDomainName" );
		return this;
	}
	
	/**
	 * Parser
	 */
	function from( required string aDomain ){
		var domain = domain.from( aDomain );

		return domain;
	}

	/**
	 * index
	 */
	function hasPublicSuffix( required string aDomain ){
		return variables.domain.from( arguments.aDomain ).hasPublicSuffix();
	}
	
}