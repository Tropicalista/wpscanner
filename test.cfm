<cfscript>
cfdbinfo( type="Version", name="local.dbInfo" );
dump(local.dbInfo);

cfdbinfo( type="tables" name="tables" datasource="wpscan" );
dump(tables);
abort;
</cfscript>