component extends="coldbox.system.EventHandler"{

	// Default Action
	function index(event,rc,prc){
		rc.lastChecked = getInstance( "site@admin" ).limit( 10 ).get();
		//dump(rc.lastChecked);
		event.setView( "main/index" );
	}

	function test(event,rc,prc){
		var host = "attesawp.com";
		//sslCertificateInstall(host);
		cfhttp( url="https://#host#", result="res" );
		writedump(res);
		abort;
	}

	function template(event,rc,prc){
		//dump(rc.lastChecked);
		event.setView( "main/template" );
	}

	// Do something
	function doSomething(event,rc,prc){
		setNextEvent( "main.index" );
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit(event,rc,prc){

	}

	function onRequestStart(event,rc,prc){

	}

	function onRequestEnd(event,rc,prc){

	}

	function onSessionStart(event,rc,prc){

	}

	function onSessionEnd(event,rc,prc){
		var sessionScope = event.getValue("sessionReference");
		var applicationScope = event.getValue("applicationReference");
	}

	function onException(event,rc,prc){
		//Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		//Place exception handler below:

	}

	function onMissingTemplate(event,rc,prc){
		//Grab missingTemplate From request collection, placed by ColdBox
		var missingTemplate = event.getValue("missingTemplate");

	}	

    function onAuthenticationFailure( event, rc, prc ) {
        relocate( "admin/login" );
    }
    
}