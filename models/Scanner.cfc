/**
 * My Hint
 */
component accessors="true"{

    property name="hyper" inject="HyperBuilder@Hyper";
	
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
