(window.webpackJsonp=window.webpackJsonp||[]).push([[16],{106:function(t,s,e){"use strict";var i=e(21);e.n(i).a},107:function(t,s,e){"use strict";var i=e(22);e.n(i).a},108:function(t,s,e){"use strict";e(0).default.filter("firstDot",(function(t){return t.split(".")[0]+"."}))},109:function(t,s,e){"use strict";e(0).default.filter("truncate",(function(t){return t.replace(/<\/?[^>]+>/gi," ").substring(0,280)+"..."}))},12:function(t,s,e){"use strict";e.d(s,"a",(function(){return i}));const i={state:{finished:!1,noTheme:!1,themes:[],plugins:[]},setNoTheme(){this.state.noTheme=!0},reset(){this.state.finished=!1,this.state.noTheme=!1,this.state.themes=[],this.state.plugins=[]},addThemes(t){t.length||this.setNoTheme(),this.state.themes=t},finish(){this.state.finished=!0},getTheme(t){axios.post("/api/wordpress/theme",{theme:t}).then(t=>{this.addThemes(t.data.data),this.getThemeFromDB(t.data.data)}).catch(t=>console.log(t.response))},getThemeFromDB(t){axios.post("/api/themeFromDb",{theme:t}).then(t=>{this.addThemes(t.data),this.finish()}).catch(t=>console.log(t.response))}}},2:function(t,s,e){"use strict";const i=new(e(0).default);s.a=i},21:function(t,s,e){},22:function(t,s,e){},5:function(t,s,e){"use strict";e(106);var i=e(3),a=Object(i.a)({},(function(){var t=this.$createElement;this._self._c;return this._m(0)}),[function(){var t=this.$createElement,s=this._self._c||t;return s("div",{staticClass:"loader",staticStyle:{"min-height":"50px"}},[s("div",{staticClass:"lds-facebook"},[s("div"),this._v(" "),s("div"),this._v(" "),s("div")])])}],!1,null,null,null);s.a=a.exports},70:function(t,s,e){"use strict";var i=e(12);const a={state:{finished:!1,slugs:[],noPlugins:!1,baseUrl:"",pluginList:[],plugins:[]},getAllData(t){return t.plugins.length?(this.state.slugs=t.plugins,this.state.baseUrl=t.baseUrl,Promise.all(this.state.slugs.map(this.fetchData)).then(t=>{this.state.plugins=t,this.askToDB()})):(this.state.noPlugins=!0,void this.finish())},fetchData:t=>axios.get("https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]="+t).then((function(s){return s.data.error&&(s.data={notFound:!0,slug:t}),s.data})).catch((function(t){return{success:!1,error:t}})),askToDB(){axios.post("/api/plugins",this.state).then(t=>{this.state.pluginList=t.data,this.state.pluginList.length||(this.state.noPlugins=!1),this.finish()})},reset(){this.state.pluginList=[],this.state.noPlugins=!1,this.state.finished=!1},finish(){this.state.finished=!0}};var n=e(2),l={data:()=>({storeState:i.a,pluginState:a,target:"",hasError:!1,loading:!1}),methods:{validate(t){this.loading=!0,i.a.reset(),a.reset(),t.trim(),n.a.$emit("reset"),axios.post("/api/validate",{target:t}).then(s=>{this.scan(t)}).catch(t=>{this.hasError=!0})},scan(t){this.hasError=!1,axios.post("/api/wordpress/scan",{target:t}).then(t=>{this.loading=!1,document.getElementById("report").scrollIntoView();let s=t.data.data;n.a.$emit("scanned-site",s),axios.post("/api/site",s)}).catch(t=>{console.log(t)}).then(()=>{})}},components:{Spinner:e(5).a}},o=e(3),r=Object(o.a)(l,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("form",{on:{submit:function(t){t.preventDefault()}}},[e("div",{staticClass:"form-group"},[e("label",{attrs:{for:"exampleInputEmail1"}},[t._v("Insert website address")]),t._v(" "),e("div",{staticClass:"input-group mb-3"},[e("input",{directives:[{name:"model",rawName:"v-model",value:t.target,expression:"target"}],staticClass:"form-control",class:{"is-invalid":t.hasError},attrs:{type:"text",placeholder:"https://www.example.com","aria-label":"Recipient's username","aria-describedby":"basic-addon2"},domProps:{value:t.target},on:{keyup:function(s){return!s.type.indexOf("key")&&t._k(s.keyCode,"enter",13,s.key,"Enter")?null:t.validate(t.target)},keydown:function(s){if(!s.type.indexOf("key")&&t._k(s.keyCode,"space",32,s.key,[" ","Spacebar"]))return null;s.preventDefault()},input:function(s){s.target.composing||(t.target=s.target.value)}}}),t._v(" "),e("div",{staticClass:"input-group-append"},[e("button",{staticClass:"btn btn-primary",attrs:{type:"button",bnvb:""},on:{click:function(s){return t.validate(t.target)}}},[t._v("GO\r\n                    "),e("svg",{staticClass:"bi bi-chevron-double-right",attrs:{width:"1em",height:"1em",viewBox:"0 0 16 16",fill:"currentColor",xmlns:"http://www.w3.org/2000/svg"}},[e("path",{attrs:{"fill-rule":"evenodd",d:"M3.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L9.293 8 3.646 2.354a.5.5 0 010-.708z","clip-rule":"evenodd"}}),t._v(" "),e("path",{attrs:{"fill-rule":"evenodd",d:"M7.646 1.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L13.293 8 7.646 2.354a.5.5 0 010-.708z","clip-rule":"evenodd"}})])])]),t._v(" "),e("div",{staticClass:"invalid-feedback"},[t._v("\r\n            Please insert a valid URL\r\n            ")]),t._v(" "),e("hr")])]),t._v(" "),t.loading?e("spinner"):t._e()],1)}),[],!1,null,null,null);s.a=r.exports},71:function(t,s,e){"use strict";e(12);var i=e(5),a=e(2),n={data:()=>({target:"",loading:!1,apps:[]}),mounted(){a.a.$on("scanned-site",t=>{this.loading=!0,this.target=t.baseUrl,this.getApps(this.target)})},methods:{getApps(t){axios.post("/api/apps",{target:t}).then(t=>{this.apps=t.data.data,this.loading=!1}).catch(t=>{this.loading=!1,console.log(t.response)})}},components:{Spinner:i.a}},l=(e(107),e(3)),o=Object(l.a)(n,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return t.target?e("div",{staticClass:"col-md-6"},[e("h3",[t._v("Apps used")]),t._v(" "),t.loading?e("spinner"):t._e(),t._v(" "),e("ul",{staticClass:"list-group list-group-flush"},t._l(t.apps.applications,(function(s){return e("li",{staticClass:"list-group-item"},[e("span",{staticClass:"icon-container mr-2"},[e("img",{attrs:{src:"/includes/images/icons/"+s.icon}})]),t._v(" "),e("a",{attrs:{href:s.website,target:"_blank"}},[t._v(t._s(s.name))]),t._v(" "),e("code",[t._v(t._s(s.version))])])})),0)],1):t._e()}),[],!1,null,null,null);s.a=o.exports},72:function(t,s,e){"use strict";var i=e(2),a={data:()=>({show:!1,loading:!1,themes:[]}),mounted(){i.a.$on("reset",t=>{this.show=!1,this.reset()}),i.a.$on("scanned-site",t=>{this.show=!0,this.loading=!0,this.getTheme(t)})},methods:{getUrl:t=>"/out/theme/"+t.slug,getTheme(t){axios.post("/api/wordpress/theme",{theme:t.theme}).then(t=>{this.themes=t.data.data,this.getThemeFromDB(this.themes)}).catch(t=>{this.finish(),console.log(t)})},getThemeFromDB(t){axios.post("/api/themeFromDb",{theme:t}).then(t=>{this.themes=t.data,this.finish()}).catch(t=>{this.finish(),console.log(t)})},finish(){this.loading=!1},reset(){this.loading=!1,this.show=!1,this.themes=[]}},components:{Spinner:e(5).a}},n=e(3),l=Object(n.a)(a,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return t.show?e("div",{staticClass:"mb-5"},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-md-12"},[e("h2",{staticClass:"pb-2"},[t._v("Themes")]),t._v(" "),t.loading?e("spinner"):t._e(),t._v(" "),t.loading||t.themes.length?t._e():e("div",{staticClass:"alert alert-danger",attrs:{role:"alert"}},[t._v("\n              No WordPress Theme found!\n            ")])],1)]),t._v(" "),t._l(t.themes,(function(s){return e("div",{staticClass:"card mb-3 shadow-sm"},[e("div",{staticClass:"row no-gutters"},[e("div",{staticClass:"col-md-4"},[e("a",{attrs:{href:t.getUrl(s),target:"_blank"}},[s.screenshot?e("img",{staticClass:"card-img",attrs:{src:s.screenshot}}):e("svg",{staticClass:"bd-placeholder-img card-img-top",attrs:{width:"100%",height:"225",xmlns:"http://www.w3.org/2000/svg",preserveAspectRatio:"xMidYMid slice",focusable:"false",role:"img","aria-label":"Placeholder: Thumbnail"}},[e("title",[t._v("Placeholder")]),t._v(" "),e("rect",{attrs:{width:"100%",height:"100%",fill:"#55595c"}}),t._v(" "),e("text",{attrs:{x:"50%",y:"50%",fill:"#eceeef",dy:".3em"}},[t._v("No screenshot")])])])]),t._v(" "),e("div",{staticClass:"col-md-8"},[e("div",{staticClass:"card-body"},[e("h5",{staticClass:"card-title"},[e("a",{attrs:{href:t.getUrl(s),target:"_blank"}},[t._v(t._s(s.name))])]),t._v(" "),s.name?e("ul",[e("li",[e("b",[t._v("Title:")]),t._v(" "+t._s(s.name))]),t._v(" "),e("li",[e("b",[t._v("Description:")]),t._v(" "+t._s(t._f("truncate")(s.description)))]),t._v(" "),e("li",[e("b",[t._v("Author:")]),t._v(" "+t._s(s.author))]),t._v(" "),e("li",[e("b",[t._v("Version:")]),t._v(" "+t._s(s.version))]),t._v(" "),e("li",[e("b",[t._v("Url:")]),t._v(" "),e("a",{attrs:{href:t.getUrl(s),target:"_blank"}},[t._v(t._s(s.themeUri))])])]):e("h3",[t._v("We have found a WordPress theme on this site, but cannot find any additional informations. Sorry!")])])])])])}))],2):t._e()}),[],!1,null,null,null);s.a=l.exports},73:function(t,s,e){"use strict";var i=e(2),a={data:()=>({slugs:[],show:!1,loading:!1,plugins:[],baseUrl:"",pluginList:[]}),mounted(){i.a.$on("reset",t=>{this.show=!1,this.reset()}),i.a.$on("scanned-site",t=>{this.show=!0,this.loading=!0,this.getPlugins(t)})},methods:{getUrl:t=>"/out/plugin/"+t.slug,getPlugins(t){if(this.baseUrl=t.baseUrl,t.plugins.length)return this.slugs=t.plugins,Promise.all(this.slugs.map(this.fetchData)).then(t=>{this.plugins=t,this.askToDB()});this.loading=!1},fetchData:t=>axios.get("https://api.wordpress.org/plugins/info/1.2/?action=plugin_information&request[slug]="+t).then((function(s){return s.data.error&&(s.data={notFound:!0,slug:t}),s.data})).catch((function(t){return{success:!1,error:t}})),askToDB(){axios.post("/api/plugins",{plugins:this.plugins,slugs:this.slugs,baseUrl:this.baseUrl}).then(t=>{this.pluginList=t.data,this.pluginList.length||(this.noPlugins=!1),this.loading=!1})},reset(){this.pluginList=[],this.basseUrl="",this.plugins=[],this.loading=!1,this.show=!1}},components:{Spinner:e(5).a}},n=e(3),l=Object(n.a)(a,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return t.show?e("div",{staticClass:"mb-5"},[e("div",{staticClass:"row"},[e("div",{staticClass:"col-md-12"},[e("h2",{staticClass:"pb-2"},[t._v("Plugins")]),t._v(" "),t.loading?e("spinner"):t._e(),t._v(" "),t.pluginList.length||t.loading?t._e():e("div",{staticClass:"alert alert-danger",attrs:{role:"alert"}},[t._v("\r\n            No WordPress Plugin found!\r\n          ")])],1)]),t._v(" "),t._l(t.pluginList,(function(s){return e("div",{staticClass:"card mb-3 shadow-sm"},[e("div",{staticClass:"row no-gutters"},[e("div",{staticClass:"col-md-4"},[e("a",{attrs:{href:t.getUrl(s),target:"_blank"}},[e("img",{staticClass:"card-img",attrs:{src:s.screenshot}})])]),t._v(" "),e("div",{staticClass:"col-md-8"},[e("div",{staticClass:"card-body"},[e("h5",{staticClass:"card-title"},[e("a",{attrs:{href:t.getUrl(s),target:"_blank"}},[t._v(t._s(s.name))])]),t._v(" "),e("p",{staticClass:"card-text",domProps:{innerHTML:t._f("truncate")(s.description)}}),t._v(" "),e("p",{staticClass:"card-text"},[e("small",{staticClass:"text-muted"},[t._v("Author: "+t._s(s.author))])])])])])])}))],2):t._e()}),[],!1,null,null,null);s.a=l.exports},74:function(t,s,e){"use strict";e(12);var i=e(5),a=e(2),n={data:()=>({target:"",loading:!1,geo:{}}),mounted(){a.a.$on("scanned-site",t=>{this.loading=!0,this.target=t.baseUrl,this.getIp(this.target)})},methods:{getIp(t){axios.post("api/ip",{target:t}).then(t=>{this.geo=t.data,this.loading=!1}).catch(t=>console.log(t.response))}},components:{Spinner:i.a}},l=e(3),o=Object(l.a)(n,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return t.target?e("div",{staticClass:"col-md-6"},[e("h3",[t._v("Site Geo IP")]),t._v(" "),t.loading?e("spinner"):t._e(),t._v(" "),t.geo.ip?e("ul",{staticClass:"list-group list-group-flush"},[e("li",{staticClass:"list-group-item"},[t._v("IP: "+t._s(t.geo.ip))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("City: "+t._s(t.geo.city))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Region: "+t._s(t.geo.region))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Country: "),e("img",{attrs:{src:"/includes/images/flags/"+t.geo.country+".png"}}),t._v(" "+t._s(t.geo.country))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Postal Code: "+t._s(t.geo.postal))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("European Union: "+t._s(t.geo.in_eu))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Latitude/Longitude: "+t._s(t.geo.latitude)+"/"+t._s(t.geo.longitude))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Time Zone: "+t._s(t.geo.timezone))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Calling Code: "+t._s(t.geo.country_calling_code))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Currency: "+t._s(t.geo.currency))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Languages: "+t._s(t.geo.languages))]),t._v(" "),e("li",{staticClass:"list-group-item"},[t._v("Org: "+t._s(t.geo.org))])]):t._e()],1):t._e()}),[],!1,null,null,null);s.a=o.exports},88:function(t,s,e){"use strict";e.r(s),function(t,s){var i=e(71),a=e(72),n=e(70),l=e(73),o=e(74);e(108),e(109);const r=e(32).default;e(0),window.axios=r,new s({el:"#app",components:{Theme:a.a,Checker:n.a,Plugins:l.a,Apps:i.a,Geo:o.a},mounted:function(){s.config.devtools&&console.log&&(console.log("ColdBox, Vue and Vueify all set to go!"),console.log("Vue Version "+s.version))}})}.call(this,e(0).default,e(0).default)}},[[88,2,0]]]);
//# sourceMappingURL=app.026f59a829ac90026ff1.js.map