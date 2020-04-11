/**
 * A ColdBox Event Handler
 */
component{

	property name="fileManager" inject="FileManager@filemanager";
	property name="settings" inject="coldbox:moduleSettings:filemanager";
	property name="disks" inject="coldbox:moduleSettings:cbfs";
	property name="streamBuilder" inject="StreamBuilder@cbstreams";

	/**
	 * Home page
	 */
	function index( event, rc, prc ){
		prc.assetBag.addJavascriptToFooter( "https://file-manager.webmai.ru/vendor/file-manager/js/file-manager.js" );
		event.setView( "home/index" );
	}

	/**
	 * Home page
	 */
	function initialize( event, rc, prc ){
dump(disks);
abort;
		var config = {
			leftDisk: "",
			rightDisk: "",
			windowsVonfig: "",
			lang: "en",
			disks: disks
		}
		var result = {
			status = "success",
			message = ""
		}

		var res = {};
		res.config = config;
		res.result = result;
		event.renderData( type="json", data=res );

	}

	/**
	 * Home page
	 */
	function content( event, rc, prc ){
		event.paramValue( "disk","" );
		event.paramValue( "path","" );
		dump(disks);
		abort;
		fileManager.content( rc.disk, rc.path );
		event.renderData( type="json", data=res );
	}


}
