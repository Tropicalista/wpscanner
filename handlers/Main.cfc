component extends="coldbox.system.EventHandler"{

	// Default Action
	function index(event,rc,prc){
		rc.lastChecked = getInstance( "site@admin" ).limit( 10 ).get();
		event.setView( "main/index" );
	}

	function out(event,rc,prc){
		cfheader( name="X-Robots-Tag" value="noindex, nofollow");

		if( rc.what EQ "theme" ){
			var obj = getInstance( "theme@admin" ).where( 'slug', rc.slug ).first();
		}
		if( rc.what EQ "plugin" ){
			var obj = getInstance( "plugin@admin" ).where( 'slug', rc.slug ).first();
		}

		if( !isNull( obj ) ){
			var referralUrl = obj.getMemento().referralUrl
			if( !len( referralUrl ) ){
				location( "/", "no", 301 );
			}
			location( referralUrl, "no", 301 );
		}
		location( "/", "no", 301 );
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