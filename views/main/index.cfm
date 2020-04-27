﻿<cfoutput>

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

  <div class="bg-light" id="report">
    <div class="container py-2">
      <theme></theme> 
      <plugins></plugins>
    </div>
  </div>

  <div class="container py-2">
    <div class="row">
      <apps></apps>
      <geo></geo>
    </div>
  </div>

  <div class="container">
    <div class="row py-2">
      
      <div class="col-md-6">
        <a href="https://it.siteground.com/go/z32en34exu" target="_blank"><img border="0" src="https://uapi.siteground.com/img/affiliate/en/NOPRICE/general_EN_general-hosting-medium-rectangle-light.jpg"></a>      
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