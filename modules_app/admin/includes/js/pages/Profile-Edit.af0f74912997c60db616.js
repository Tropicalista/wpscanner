(window.webpackJsonp=window.webpackJsonp||[]).push([[9],{78:function(e,t,s){"use strict";s.r(t);var r=s(208),a=s(210),o=s(214),l=s(211),i={props:{value:File,label:String,accept:String,errors:{type:Array,default:()=>[]}},watch:{value(e){e||(this.$refs.file.value="")}},methods:{filesize(e){var t=Math.floor(Math.log(e)/Math.log(1024));return 1*(e/Math.pow(1024,t)).toFixed(2)+" "+["B","kB","MB","GB","TB"][t]},browse(){this.$refs.file.click()},change(e){this.$emit("input",e.target.files[0])},remove(){this.$emit("input",null)}}},n=s(3),p=Object(n.a)(i,(function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[e.label?s("label",{staticClass:"form-label"},[e._v(e._s(e.label)+":")]):e._e(),e._v(" "),s("div",{staticClass:"form-input p-0",class:{error:e.errors.length}},[s("input",{ref:"file",staticClass:"hidden",attrs:{type:"file",accept:e.accept},on:{change:e.change}}),e._v(" "),e.value?s("div",{staticClass:"flex items-center justify-between p-2"},[s("div",{staticClass:"flex-1 pr-1"},[e._v(e._s(e.value.name)+" "),s("span",{staticClass:"text-grey-dark text-xs"},[e._v("("+e._s(e.filesize(e.value.size))+")")])]),e._v(" "),s("button",{staticClass:"px-4 py-1 bg-grey-dark hover:bg-grey-darker rounded-sm text-xs font-medium text-white",attrs:{type:"button"},on:{click:e.remove}},[e._v("\n        Remove\n      ")])]):s("div",{staticClass:"p-2"},[s("button",{staticClass:"px-4 py-1 bg-grey-dark hover:bg-grey-darker rounded-sm text-xs font-medium text-white",attrs:{type:"button"},on:{click:e.browse}},[e._v("\n        Browse\n      ")])])]),e._v(" "),e.errors.length?s("div",{staticClass:"form-error"},[e._v(e._s(e.errors[0]))]):e._e()])}),[],!1,null,null,null).exports,m=s(212),u={metaInfo(){return{title:`${this.form.first_name} ${this.form.last_name}`}},layout:(e,t)=>e(r.a,[t]),components:{LoadingButton:a.a,SelectInput:o.a,TextInput:l.a,FileInput:p,TrashedMessage:m.a},props:{user:Object},remember:"form",data(){return{sending:!1,form:{first_name:this.user.first_name,last_name:this.user.last_name,email:this.user.email,password:this.user.password,owner:this.user.owner,photo:null}}},methods:{submit(){this.sending=!0;var e=new FormData;e.append("first_name",this.form.first_name||""),e.append("last_name",this.form.last_name||""),e.append("email",this.form.email||""),e.append("password",this.form.password||""),e.append("new_password",this.form.new_password||""),e.append("owner",this.form.owner?"1":"0"),e.append("photo",this.form.photo||""),e.append("_method","put"),this.$inertia.put("/admin/profile",e).then(()=>{this.sending=!1,0===Object.keys(this.$page.errors).length&&(this.form.photo=null,this.form.password=null)})},destroy(){confirm("Are you sure you want to delete yourself?")},restore(){confirm("Are you sure you want to restore this user?")}}},f=Object(n.a)(u,(function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",[s("div",{staticClass:"mb-8 flex justify-start max-w-lg"},[s("h1",{staticClass:"font-bold text-3xl"},[s("span",{staticClass:"text-indigo-light"},[e._v("Profile")]),e._v(" "),s("span",{staticClass:"text-indigo-light font-medium"},[e._v("/")]),e._v("\n      "+e._s(e.form.first_name)+" "+e._s(e.form.last_name)+"\n    ")]),e._v(" "),e.user.photo?s("img",{staticClass:"block w-8 h-8 rounded-full ml-4",attrs:{src:e.user.photo}}):e._e()]),e._v(" "),s("div",{staticClass:"bg-white rounded shadow overflow-hidden max-w-lg"},[s("form",{on:{submit:function(t){return t.preventDefault(),e.submit(t)}}},[s("div",{staticClass:"p-8 -mr-6 -mb-8 flex flex-wrap"},[s("text-input",{staticClass:"pr-6 pb-8 w-full lg:w-1/2",attrs:{errors:e.$page.errors.first_name,label:"First name"},model:{value:e.form.first_name,callback:function(t){e.$set(e.form,"first_name",t)},expression:"form.first_name"}}),e._v(" "),s("text-input",{staticClass:"pr-6 pb-8 w-full lg:w-1/2",attrs:{errors:e.$page.errors.last_name,label:"Last name"},model:{value:e.form.last_name,callback:function(t){e.$set(e.form,"last_name",t)},expression:"form.last_name"}}),e._v(" "),s("text-input",{staticClass:"pr-6 pb-8 w-full lg:w-1/2",attrs:{errors:e.$page.errors.email,label:"Email"},model:{value:e.form.email,callback:function(t){e.$set(e.form,"email",t)},expression:"form.email"}}),e._v(" "),s("file-input",{staticClass:"pr-6 pb-8 w-full lg:w-1/2",attrs:{errors:e.$page.errors.photo,type:"file",accept:"image/*",label:"Photo"},model:{value:e.form.photo,callback:function(t){e.$set(e.form,"photo",t)},expression:"form.photo"}}),e._v(" "),s("text-input",{staticClass:"pr-6 pb-8 w-full lg:w-1/2",attrs:{errors:e.$page.errors.password,type:"password",autocomplete:"new-password",label:"Password"},model:{value:e.form.password,callback:function(t){e.$set(e.form,"password",t)},expression:"form.password"}}),e._v(" "),s("text-input",{staticClass:"pr-6 pb-8 w-full lg:w-1/2",attrs:{errors:e.$page.errors.new_password,type:"password",autocomplete:"new-password",label:"New Password"},model:{value:e.form.new_password,callback:function(t){e.$set(e.form,"new_password",t)},expression:"form.new_password"}})],1),e._v(" "),s("div",{staticClass:"px-8 py-4 bg-grey-lightest border-t border-grey-lighter flex items-center"},[e.user.deleted_at?e._e():s("button",{staticClass:"text-red hover:underline",attrs:{tabindex:"-1",type:"button"},on:{click:e.destroy}},[e._v("Delete User")]),e._v(" "),s("loading-button",{staticClass:"btn-indigo ml-auto",attrs:{loading:e.sending,type:"submit"}},[e._v("Update User")])],1)])])])}),[],!1,null,null,null);t.default=f.exports}}]);
//# sourceMappingURL=Profile-Edit.af0f74912997c60db616.js.map