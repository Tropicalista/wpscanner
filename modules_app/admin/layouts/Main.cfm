<cfoutput>
<!DOCTYPE html>
<html class="h-full bg-grey-lighter">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>Inertia ColdBox Test</title>

    <!---Base URL --->
    <base href="#event.getHTMLBaseURL()#" />

    <link rel="stylesheet" href="#html.elixirPath( fileName="css/admin.css", useModuleRoot=true )#">
    <link rel="stylesheet" type="text/css" href="https://cdn.quilljs.com/1.3.4/quill.snow.css">
</head>
<body class="font-sans leading-none text-grey-darkest antialiased">
    <div class="container">
        #renderView()#
    </div>

    <script src="#html.elixirPath( "js/runtime.js" )#"></script>
    <script src="#html.elixirPath( "js/vendor.js" )#"></script>
    <script src="#html.elixirPath( fileName="js/admin.js", useModuleRoot=true )#"></script>
    <!---<script src="#html.elixirPath( "../modules_app/admin/includes/js/admin.js" )#"></script>
    <script src="#RemoveChars( html.elixirPath( fileName="/js/admin.js", useModuleRoot=true ), 1, 1 )#"></script>--->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/quill/1.3.7/quill.min.js" integrity="sha256-xnX1c4jTWYY3xOD5/hVL1h37HCCGJx+USguyubBZsHQ=" crossorigin="anonymous"></script>

</body>
</html>
</cfoutput>
