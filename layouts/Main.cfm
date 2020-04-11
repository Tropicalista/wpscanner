<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Welcome to Coldbox!</title>
  <meta name="description" content="ColdBox Application Template">
  <meta name="author" content="Ortus Solutions, Corp">

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
      <a href="##" class="navbar-brand d-flex align-items-center">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="mr-2" viewBox="0 0 24 24" focusable="false"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx="12" cy="13" r="4"></circle></svg>
        <strong>Album</strong>
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
      <a href="##">Back to top</a>
    </p>
    <p>Album example is © Bootstrap, but please download and customize it for yourself!</p>
    <p>New to Bootstrap? <a href="https://getbootstrap.com/">Visit the homepage</a> or read our <a href="/docs/4.4/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>

  <script type="application/javascript" src="#html.elixirPath( "js/runtime.js" )#"></script>
  <script type="application/javascript" src="#html.elixirPath( "js/vendor.js" )#"></script>
  <script type="application/javascript" src="#html.elixirPath( "js/app.js" )#"></script>
</body>
</html>
</cfoutput>