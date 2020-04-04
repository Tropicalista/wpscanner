component extends="BaseHandler"{

	property name="Wappalyzer" inject="Wappalyzer";
	property name="themeScanner" inject="ThemeScanner";

	this.constraints = {
		// Approach #1
		target = {
			required : true, 
			validator : "UrlValidator" 
		}
 	};

	function preHandler( event, rc, prc ){
		event.paramValue('target','http://ciccddio.it/');
		if( !len( reMatchNoCase( "^https?://", trim( rc.target ) ) ) ){
			rc.target = "http://" & rc.target;
		}		
	}

	/**
	 * Home page
	 */
	function getApps( event, rc, prc ){

		validateOrFail( target=rc, constraints=this.constraints );
		var result = Wappalyzer.check(rc.target);
		prc.response.setData( result );

	}

	/**
	 * Home page
	 */
	function scan( event, rc, prc ){
		validateOrFail( target=rc, constraints=this.constraints );

		var result = themeScanner.scan( rc.target );

		prc.response.setData( result );

	}

	/**
	 * Home page
	 */
	function getTheme( event, rc, prc ){

		var result = themeScanner.getTheme( rc.theme );

		prc.response.setData( result );

	}

	/**
	 * getThemeScreenshot
	 */
	function getThemeScreenshot( event, rc, prc ){

		var result = themeScanner.getThemeScreenshot( rc.theme );

		prc.response.setData( result );

	}

	/**
	 * Home page
	 */
	function validate( event, rc, prc ){

		validateOrFail( target=rc, constraints=this.constraints );

		prc.response.setData( true );

	}

}
