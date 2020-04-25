component {

    property name="hyper" inject="HyperBuilder@Hyper";
	property name="urlParser" inject="UrlParser";

	/**
	 * init
	 */
	function init(){
		return this;
	}

	/**
	 * getIp
	 */
	function getIp( required string aDomain ){
		var ip = getIpFromDomain( arguments.aDomain );
		var req = hyper.setMethod( "GET" )
			.setUrl( "https://ipapi.co/" & ip & "/json/" )
			.send();

		if( req.isSuccess() ){
			return deserializeJson( req.getData() );
			//return getMemento( deserializeJson(req.getData()) );
		}
		return {}
	}

	/**
	 * getIpFromDomain
	 */
	function getIpFromDomain( aDomain ){
		var parsed = urlParser.parse( aDomain );
		var ip = CreateObject("java", "java.net.InetAddress").getByName( parsed.host ).getHostAddress();
		return ip;
	}

	/**
	 * getMemento
	 */
	function getMemento( obj ){
		return {
			"IP Address" = obj.ip,
			"City" = obj.city,
			"Region" = obj.region,
			"Country" = obj.country_code,
			"European Union" = obj.in_eu,
			"Provider" = obj.org,
			"Latitude / Longitude" = obj.latitude & "," & obj.longitude,
			"Languages" = obj.languages,
			"Time Zone" = obj.timezone
		}
	}

}