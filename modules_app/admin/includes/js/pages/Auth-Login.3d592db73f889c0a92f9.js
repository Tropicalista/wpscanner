(window.webpackJsonp=window.webpackJsonp||[]).push([[3],{78:function(e,t,r){"use strict";r.r(t);var s=r(207),a=r(215),o=r(208),i={metaInfo:{title:"Login"},components:{LoadingButton:s.a,Logo:a.a,TextInput:o.a},props:{errors:Object},data:()=>({sending:!1,form:{email:null,password:null,remember:null}}),methods:{submit(){this.sending=!0,this.$inertia.post("/admin/login",{email:this.form.email,password:this.form.password,remember:this.form.remember}).then(()=>this.sending=!1)}}},l=r(3),m=Object(l.a)(i,(function(){var e=this,t=e.$createElement,r=e._self._c||t;return r("div",{staticClass:"p-6 bg-indigo-darker min-h-screen flex justify-center items-center"},[r("div",{staticClass:"w-full max-w-sm"},[r("logo",{staticClass:"block mx-auto w-full max-w-xs fill-white",attrs:{height:"50"}}),e._v(" "),r("form",{staticClass:"mt-8 bg-white rounded-lg shadow-lg overflow-hidden",on:{submit:function(t){return t.preventDefault(),e.submit(t)}}},[r("div",{staticClass:"px-10 py-12"},[r("h1",{staticClass:"text-center font-bold text-3xl"},[e._v("Welcome Back!")]),e._v(" "),r("div",{staticClass:"mx-auto mt-6 w-24 border-b-2"}),e._v(" "),r("text-input",{staticClass:"mt-10",attrs:{errors:e.$page.errors.email,label:"Email",type:"email",autofocus:"",autocapitalize:"off"},model:{value:e.form.email,callback:function(t){e.$set(e.form,"email",t)},expression:"form.email"}}),e._v(" "),r("text-input",{staticClass:"mt-6",attrs:{errors:e.$page.errors.password,label:"Password",type:"password"},model:{value:e.form.password,callback:function(t){e.$set(e.form,"password",t)},expression:"form.password"}}),e._v(" "),r("label",{staticClass:"mt-6 select-none flex items-center",attrs:{for:"remember"}},[r("input",{directives:[{name:"model",rawName:"v-model",value:e.form.remember,expression:"form.remember"}],staticClass:"mr-1",attrs:{id:"remember",type:"checkbox"},domProps:{checked:Array.isArray(e.form.remember)?e._i(e.form.remember,null)>-1:e.form.remember},on:{change:function(t){var r=e.form.remember,s=t.target,a=!!s.checked;if(Array.isArray(r)){var o=e._i(r,null);s.checked?o<0&&e.$set(e.form,"remember",r.concat([null])):o>-1&&e.$set(e.form,"remember",r.slice(0,o).concat(r.slice(o+1)))}else e.$set(e.form,"remember",a)}}}),e._v(" "),r("span",{staticClass:"text-sm"},[e._v("Remember Me")])])],1),e._v(" "),r("div",{staticClass:"px-10 py-4 bg-grey-lightest border-t border-grey-lighter flex justify-between items-center"},[r("a",{staticClass:"hover:underline",attrs:{tabindex:"-1",href:"#reset-password"}},[e._v("Forget password?")]),e._v(" "),r("loading-button",{staticClass:"btn-indigo",attrs:{loading:e.sending,type:"submit"}},[e._v("Login")])],1)])],1)])}),[],!1,null,null,null);t.default=m.exports}}]);
//# sourceMappingURL=Auth-Login.3d592db73f889c0a92f9.js.map