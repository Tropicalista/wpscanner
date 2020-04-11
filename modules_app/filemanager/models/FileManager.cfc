component {

	property name="settings" inject="coldbox:moduleSettings:filemanager";
	property name="cbfs" inject="cbfs:disks";

	/**
	 * index
	 */
	function content( required string disk, required string path ){
		listing = directoryList( arguments.disk, false, "query" );
		dump(cbfs);
		abort;
	}

}