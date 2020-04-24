<cfoutput>

  <section class="jumbotron text-center mb-0">
    <div class="container">
      <p class="lead text-muted">Want to know what theme or what plugins is using a site? Use this free tool.</p>
      	<div class="row">
      		<div class="col-md-6 offset-md-3">
      		<checker></checker>
  			</div>
  		</div>
    </div>
  </section>

  <div class="bg-light">
    <div class="container py-5">
      <theme></theme>	
      <plugins></plugins>
      <geo></geo>
      <apps></apps>
    </div>
  </div>

  <div class="container">
    <div class="row py-5">
      
      <div class="col-md-6">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Last checked</th>
            </tr>
          </thead>
          <tbody>
            <cfloop array="#rc.lastChecked#" index="site">
            <tr>
              <td>#site.getUrl()#</td>
            </tr>
            </cfloop>
          </tbody>
        </table>
      </div>
      
      <div class="col-md-6">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">Site</th>
              <th scope="col">Theme</th>
              <th scope="col">Plugins</th>
            </tr>
          </thead>
          <tbody>
            <cfloop array="#rc.lastChecked#" index="site">
            <tr>
              <td>#site.getUrl()#</td>
              <td>the Bird</td>
              <td>@twitter</td>
            </tr>
            </cfloop>
          </tbody>
        </table>
      </div>

    </div>
  </div>

</cfoutput>