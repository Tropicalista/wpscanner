(window.webpackJsonp=window.webpackJsonp||[]).push([[16],{107:function(t,e,s){"use strict";var a=s(20);s.n(a).a},108:function(t,e,s){"use strict";var a=s(21);s.n(a).a},109:function(t,e,s){"use strict";var a=s(22);s.n(a).a},110:function(t,e,s){"use strict";var a=s(23);s.n(a).a},111:function(t,e,s){"use strict";s(0).default.filter("firstDot",(function(t){return t.split(".")[0]+"."}))},112:function(t,e,s){"use strict";s(0).default.filter("truncate",(function(t){return t.replace(/<\/?[^>]+>/gi," ").substring(0,280)+"..."}))},2:function(t,e,s){"use strict";s.d(e,"a",(function(){return a}));const a={state:{finished:!1,noTheme:!1,geo:{},apps:[],themes:[],plugins:[]},setNoTheme(){this.state.noTheme=!0},reset(){this.state.finished=!1,this.state.noTheme=!1,this.state.apps=[],this.state.themes=[],this.state.plugins=[]},addThemes(t){t.length||this.setNoTheme(),this.state.themes=t},addApps(t){this.state.apps=t},addGeo(t){this.state.geo=t},finish(){this.state.finished=!0},getTheme(t){axios.post("/api/wordpress/theme",{theme:t}).then(t=>{this.addThemes(t.data.data),this.getThemeFromDB(t.data.data)}).catch(t=>console.log(t.response))},getThemeFromDB(t){axios.post("/api/themeFromDb",{theme:t}).then(t=>{this.addThemes(t.data),this.finish()}).catch(t=>console.log(t.response))}}},20:function(t,e,s){},21:function(t,e,s){},22:function(t,e,s){},23:function(t,e,s){},7:function(t,e,s){"use strict";s.d(e,"a",(function(){return a}));const a={state:{finished:!1,slugs:[],noPlugins:!1,baseUrl:"",pluginList:[],plugins:[]},getAllData(t){return t.plugins.length?(this.state.slugs=t.plugins,this.state.baseUrl=t.baseUrl,Promise.all(this.state.slugs.map(this.fetchData)).then(t=>{this.state.plugins=t,this.askToDB()})):(this.state.noPlugins=!0,void this.finish())},fetchData:t=>axios.get("https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]="+t).then((function(e){return e.data.error&&(e.data={notFound:!0,slug:t}),e.data})).catch((function(t){return{success:!1,error:t}})),askToDB(){axios.post("/api/plugins",this.state).then(t=>{this.state.pluginList=t.data,this.state.pluginList.length||(this.state.noPlugins=!1),this.finish()})},reset(){this.state.pluginList=[],this.state.noPlugins=!1,this.state.finished=!1},finish(){this.state.finished=!0}}},71:function(t,e,s){"use strict";var a=s(2),i={data:()=>({name:"Mr ColdBox",storeState:a.a.state})},n=(s(107),s(3)),r=Object(n.a)(i,(function(){var t=this,e=t.$createElement,s=t._self._c||e;return t.storeState.apps.length?s("div",[s("h2",{staticClass:"pb-2"},[t._v("Apps")]),t._v(" "),s("div",{staticClass:"mb-5"},t._l(t.storeState.apps.applications,(function(e){return s("span",{staticClass:"badge mr-5 badge-secondary"},[t._v(t._s(e.name))])})),0)]):t._e()}),[],!1,null,null,null);e.a=r.exports},72:function(t,e,s){"use strict";var a=s(2),i={data:()=>({storeState:a.a.state}),methods:{getUrl:t=>"/out/theme/"+t.slug}},n=(s(108),s(3)),r=Object(n.a)(i,(function(){var t=this,e=t.$createElement,s=t._self._c||e;return t.storeState.finished?s("div",{staticClass:"mb-5"},[t.storeState.finished?s("div",{staticClass:"row"},[s("div",{staticClass:"col-md-12"},[s("h2",{staticClass:"pb-2"},[t._v("Themes")]),t._v(" "),t.storeState.noTheme?s("div",{staticClass:"alert alert-danger",attrs:{role:"alert"}},[t._v("\n              No WordPress Theme found!\n            ")]):t._e()])]):t._e(),t._v(" "),t._l(t.storeState.themes,(function(e){return s("div",{staticClass:"row mb-5"},[s("div",{staticClass:"col-md-4"},[s("a",{attrs:{href:t.getUrl(e),target:"_blank"}},[e.name?s("img",{staticClass:"img-fluid",attrs:{src:e.screenshot}}):s("svg",{staticClass:"bd-placeholder-img card-img-top",attrs:{width:"100%",height:"225",xmlns:"http://www.w3.org/2000/svg",preserveAspectRatio:"xMidYMid slice",focusable:"false",role:"img","aria-label":"Placeholder: Thumbnail"}},[s("title",[t._v("Placeholder")]),t._v(" "),s("rect",{attrs:{width:"100%",height:"100%",fill:"#55595c"}}),t._v(" "),s("text",{attrs:{x:"50%",y:"50%",fill:"#eceeef",dy:".3em"}},[t._v("No screenshot")])])])]),t._v(" "),s("div",{staticClass:"col-md-8"},[e.name?s("ul",[s("li",[s("b",[t._v("Title:")]),t._v(" "+t._s(e.name))]),t._v(" "),s("li",[s("b",[t._v("Description:")]),t._v(" "+t._s(t._f("truncate")(e.description)))]),t._v(" "),s("li",[s("b",[t._v("Author:")]),t._v(" "+t._s(e.author))]),t._v(" "),s("li",[s("b",[t._v("Version:")]),t._v(" "+t._s(e.version))]),t._v(" "),s("li",[s("b",[t._v("Url:")]),t._v(" "),s("a",{attrs:{href:t.getUrl(e),target:"_blank"}},[t._v(t._s(e.theme_uri))])])]):s("h3",[t._v("Cannot found a theme on this site, sorry!")])])])}))],2):t._e()}),[],!1,null,null,null);e.a=r.exports},73:function(t,e,s){"use strict";var a=s(2),i=s(7),n={data:()=>({storeState:a.a,pluginState:i.a,target:"",hasError:!1,loading:!1}),methods:{validate(t){a.a.reset(),i.a.reset(),t.trim(),axios.post("/api/validate",{target:t}).then(e=>{this.scan(t)}).catch(t=>{this.hasError=!0})},scan(t){this.loading=!0,this.hasError=!1,axios.post("/api/wordpress/scan",{target:t}).then(t=>{console.log(t);let e=t.data.data;axios.post("/api/site",e),void 0!==e.plugins?i.a.getAllData(e):(i.a.state.noPlugins=!0,i.a.finish()),void 0!==e.theme?a.a.getTheme(e.theme):a.a.setNoTheme(),this.getIp(e.baseUrl),this.getApps(e.baseUrl)}).catch(t=>{console.log(t)}).then(()=>{this.loading=!1})},getThemeScreenshot(t){axios.post("/api/wordpress/themeScreenshot",{theme:t}).then(t=>{}).catch(t=>console.log(t.response))},getApps(t){axios.post("/api/apps",{target:t}).then(t=>{a.a.addApps(t.data.data)}).catch(t=>console.log(t.response))},getIp(t){axios.post("api/ip",{target:t}).then(t=>{a.a.addGeo(t.data)}).catch(t=>console.log(t.response))}}},r=(s(109),s(3)),l=Object(r.a)(n,(function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("form",{on:{submit:function(t){t.preventDefault()}}},[s("div",{staticClass:"form-group"},[s("label",{attrs:{for:"exampleInputEmail1"}},[t._v("Insert website address")]),t._v(" "),s("div",{staticClass:"input-group mb-3"},[s("input",{directives:[{name:"model",rawName:"v-model",value:t.target,expression:"target"}],staticClass:"form-control",class:{"is-invalid":t.hasError},attrs:{type:"text",placeholder:"https://www.example.com","aria-label":"Recipient's username","aria-describedby":"basic-addon2"},domProps:{value:t.target},on:{keyup:function(e){return!e.type.indexOf("key")&&t._k(e.keyCode,"enter",13,e.key,"Enter")?null:t.validate(t.target)},keydown:function(e){if(!e.type.indexOf("key")&&t._k(e.keyCode,"space",32,e.key,[" ","Spacebar"]))return null;e.preventDefault()},input:function(e){e.target.composing||(t.target=e.target.value)}}}),t._v(" "),s("div",{staticClass:"input-group-append"},[s("button",{staticClass:"btn btn-primary",attrs:{type:"button",bnvb:""},on:{click:function(e){return t.validate(t.target)}}},[t._v("GO\r\n                    "),s("svg",{staticClass:"bi bi-chevron-double-right",attrs:{width:"1em",height:"1em",viewBox:"0 0 16 16",fill:"currentColor",xmlns:"http://www.w3.org/2000/svg"}},[s("path",{attrs:{"fill-rule":"evenodd",d:"M3.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L9.293 8 3.646 2.354a.5.5 0 010-.708z","clip-rule":"evenodd"}}),t._v(" "),s("path",{attrs:{"fill-rule":"evenodd",d:"M7.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L13.293 8 7.646 2.354a.5.5 0 010-.708z","clip-rule":"evenodd"}})])])]),t._v(" "),s("div",{staticClass:"invalid-feedback"},[t._v("\r\n            Please insert a valid URL\r\n            ")]),t._v(" "),s("hr")])]),t._v(" "),s("div",{staticClass:"loader",staticStyle:{"min-height":"50px"}},[!t.loading||t.storeState.finished||t.pluginState.finished?t._e():s("div",{staticClass:"lds-facebook"},[s("div"),s("div"),s("div")])])])}),[],!1,null,null,null);e.a=l.exports},74:function(t,e,s){"use strict";var a=s(7),i={data:()=>({storeState:a.a.state}),methods:{getUrl:t=>"/out/plugin/"+t.slug}},n=(s(110),s(3)),r=Object(n.a)(i,(function(){var t=this,e=t.$createElement,s=t._self._c||e;return t.storeState.finished?s("div",{staticClass:"mb-5"},[t.storeState.finished?s("div",{staticClass:"row"},[s("div",{staticClass:"col-md-12"},[s("h2",{staticClass:"pb-2"},[t._v("Plugins")]),t._v(" "),t.storeState.pluginList.length?t._e():s("div",{staticClass:"alert alert-danger",attrs:{role:"alert"}},[t._v("\r\n            No WordPress Plugin found!\r\n          ")])])]):t._e(),t._v(" "),t._l(t.storeState.pluginList,(function(e){return s("div",{staticClass:"card mb-3 shadow-sm"},[s("div",{staticClass:"row no-gutters"},[s("div",{staticClass:"col-md-4"},[s("a",{attrs:{href:t.getUrl(e),target:"_blank"}},[s("img",{staticClass:"card-img",attrs:{src:e.screenshot}})])]),t._v(" "),s("div",{staticClass:"col-md-8"},[s("div",{staticClass:"card-body"},[s("h5",{staticClass:"card-title"},[s("a",{attrs:{href:t.getUrl(e),target:"_blank"}},[t._v(t._s(e.name))])]),t._v(" "),s("p",{staticClass:"card-text",domProps:{innerHTML:t._f("truncate")(e.description)}}),t._v(" "),s("p",{staticClass:"card-text"},[s("small",{staticClass:"text-muted"},[t._v("Author: "+t._s(e.author))])])])])])])}))],2):t._e()}),[],!1,null,null,null);e.a=r.exports},75:function(t,e,s){"use strict";var a=s(2),i={data:()=>({storeState:a.a.state})},n=s(3),r=Object(n.a)(i,(function(){var t=this,e=t.$createElement,s=t._self._c||e;return t.storeState.finished?s("div",{staticClass:"mb-5"},[t.storeState.geo?s("div",{staticClass:"row mb-5"},[s("div",{staticClass:"col-md-6"},[s("ul",{staticClass:"list-group list-group-flush"},[s("li",{staticClass:"list-group-item"},[t._v("IP: "+t._s(t.storeState.geo.ip))])]),t._v(" "),s("table",{staticClass:"table"},[t._m(0),t._v(" "),s("tbody",t._l(t.storeState.geo,(function(e,a){return s("tr",[s("td",[t._v(t._s(a))]),t._v(" "),s("td",[t._v(t._s(e))])])})),0)])]),t._v(" "),s("div",{staticClass:"col-md-6"},t._l(t.storeState.apps.applications,(function(e){return s("span",{staticClass:"badge mr-5 badge-secondary"},[t._v(t._s(e.name))])})),0)]):t._e()]):t._e()}),[function(){var t=this.$createElement,e=this._self._c||t;return e("thead",[e("tr",[e("th",{attrs:{scope:"col"}}),this._v(" "),e("th",{attrs:{scope:"col"}})])])}],!1,null,null,null);e.a=r.exports},89:function(t,e,s){"use strict";s.r(e),function(t,e){var a=s(71),i=s(72),n=s(73),r=s(74),l=s(75);s(111),s(112);const o=s(33).default;s(0),window.axios=o,new e({el:"#app",components:{Theme:i.a,Checker:n.a,Plugins:r.a,Apps:a.a,Geo:l.a},mounted:function(){e.config.devtools&&console.log&&(console.log("ColdBox, Vue and Vueify all set to go!"),console.log("Vue Version "+e.version))}})}.call(this,s(0).default,s(0).default)}},[[89,2,0]]]);
//# sourceMappingURL=app.e31aae0b3821c4c91b75.js.map