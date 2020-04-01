component extends="BaseHandler"{

	property name="Wappalyzer" inject="Wappalyzer";

	this.allowedMethods = {
	    "index"     : "POST"
	};

	/**
	 * Home page
	 */
	function index( event, rc, prc ){
		var result = Wappalyzer.check(rc.target);
		prc.response.setData( result );
	}

}
