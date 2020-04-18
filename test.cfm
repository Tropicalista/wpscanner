<cfscript>
c = "";
if( isDefined("ciccio") ){
	cfhttp ( url="http://127.0.0.1:57764/test.cfm", result="c", userAgent="stocazzo"  );
}
</cfscript>

<cflog file="myAppLog" application="no" text="#serializeJson(getHttpRequestData())# logged on.">

