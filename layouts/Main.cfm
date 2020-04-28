<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>WpScanner - Find what theme or plugins a site's using</title>
  <meta name="description" content="ColdBox Application Template">
  <meta name="author" content="Ortus Solutions, Corp">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!---Base URL --->
  <base href="#event.getHTMLBaseURL()#" />
  <!---css --->
  <link rel="stylesheet" type="text/css" href="#html.elixirPath( "css/app.css" )#" />
    <!--- If there are any extracted Vue styles, they will be in this file --->
  <cfscript>
        if ( getCache( "template" ).getOrSet( "vue-styles", function() {
            return fileExists( expandPath( html.elixirPath( "js/app.css" ) ) );
        } ) ) {
            writeOutput( '<link rel="stylesheet" type="text/css" href="#html.elixirPath( "js/app.css" )#" />' );
        }
    </cfscript>
</head>
<body>

  <header>
    <div class="navbar navbar-dark bg-primary shadow-sm">
      <div class="container d-flex justify-content-between">
        <a href="/" class="navbar-brand d-flex align-items-center">
          <strong>WpDetector</strong>
        </a>
      </div>
    </div>
  </header>

  <!---Container And Views --->
  <main role="main" id="app">
    #renderView()#
  </main>

  <footer class="text-muted pt-3 pb-3">
    <div class="container">
      <p class="float-right">
        <a href="/##">Back to top</a>
      </p>
      <p>&##169; 2020 Made in <img src="/includes/images/flags/it.png" class="align-middle pb-1" /></p>
    </div>
  </footer>

  <script type="application/javascript" src="#html.elixirPath( "js/runtime.js" )#"></script>
  <script type="application/javascript" src="#html.elixirPath( "js/vendor.js" )#"></script>
  <script type="application/javascript" src="#html.elixirPath( "js/app.js" )#"></script>
</body>
</html>
</cfoutput>