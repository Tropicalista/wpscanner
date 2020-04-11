<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<!--- utf --->
	<meta charset="utf-8"/>
	<!--- Responsive --->
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="csrf-token" content="#csrfToken()#">
	#prc.assetBag.renderHead()#
	<!--- SES --->
	<base href="#getSetting('htmlBaseURL')#" />
	<!--- Title --->
    <title>FileBrowser</title> 
	<!--- JQuery --->

</head>
<body>
	
	#renderView()#

    #prc.assetBag.renderFooter()#

</body>
</html>
</cfoutput>