(window.webpackJsonp=window.webpackJsonp||[]).push([[8],{78:function(t,s,e){"use strict";e.r(s);var a=e(211),i=e(210),r={props:{links:Array}},l=e(3),n=Object(l.a)(r,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",{staticClass:"mt-6 -mb-1 flex flex-wrap"},[t._l(t.links,(function(s,a){return[null===s.url?e("div",{key:a,staticClass:"mr-1 mb-1 px-4 py-3 text-sm border rounded text-grey",class:{"ml-auto":"Next"===s.label}},[t._v(t._s(s.label))]):e("inertia-link",{key:a,staticClass:"mr-1 mb-1 px-4 py-3 text-sm border rounded hover:bg-white focus:border-indigo focus:text-indigo",class:{"bg-white":s.active,"ml-auto":"Next"===s.label},attrs:{href:s.url}},[t._v(t._s(s.label))])]}))],2)}),[],!1,null,null,null).exports,o=e(215),c={metaInfo:{title:"Contacts"},layout:(t,s)=>t(i.a,[s]),components:{Icon:a.a,Pagination:n,SearchFilter:o.a},props:{posts:Object,filters:Object},data(){return{form:{search:this.filters.search,trashed:this.filters.trashed}}},watch:{form:{handler:_.throttle((function(){_.pickBy(this.form);this.$inertia.replace("/contacts")}),150),deep:!0}},methods:{reset(){this.form=_.mapValues(this.form,()=>null)}}},d=Object(l.a)(c,(function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("h1",{staticClass:"mb-8 font-bold text-3xl"},[t._v("Posts")]),t._v(" "),e("div",{staticClass:"mb-6 flex justify-between items-center"},[e("search-filter",{staticClass:"w-full max-w-sm mr-4",on:{reset:t.reset},model:{value:t.form.search,callback:function(s){t.$set(t.form,"search",s)},expression:"form.search"}},[e("label",{staticClass:"block text-grey-darkest"},[t._v("Trashed:")]),t._v(" "),e("select",{directives:[{name:"model",rawName:"v-model",value:t.form.trashed,expression:"form.trashed"}],staticClass:"mt-1 w-full form-select",on:{change:function(s){var e=Array.prototype.filter.call(s.target.options,(function(t){return t.selected})).map((function(t){return"_value"in t?t._value:t.value}));t.$set(t.form,"trashed",s.target.multiple?e:e[0])}}},[e("option",{domProps:{value:null}}),t._v(" "),e("option",{attrs:{value:"with"}},[t._v("With Trashed")]),t._v(" "),e("option",{attrs:{value:"only"}},[t._v("Only Trashed")])])]),t._v(" "),e("inertia-link",{staticClass:"btn-indigo",attrs:{href:"/admin/posts/new"}},[e("span",[t._v("Create")]),t._v(" "),e("span",{staticClass:"hidden md:inline"},[t._v("Post")])])],1),t._v(" "),e("div",{staticClass:"bg-white rounded shadow overflow-x-auto"},[e("table",{staticClass:"w-full whitespace-no-wrap"},[t._m(0),t._v(" "),t._l(t.posts.data,(function(s){return e("tr",{key:t.post.id,staticClass:"hover:bg-grey-lightest focus-within:bg-grey-lightest"},[e("td",{staticClass:"border-t"},[e("inertia-link",{staticClass:"px-6 py-4 flex items-center focus:text-indigo",attrs:{href:"/admin/posts/"+t.post.id+"/edit"}},[t._v("\n            "+t._s(t.post.title)+"\n            "),t.post.deleted_at?e("icon",{staticClass:"flex-no-shrink w-3 h-3 fill-grey ml-2",attrs:{name:"trash"}}):t._e()],1)],1),t._v(" "),e("td",{staticClass:"border-t"},[e("inertia-link",{staticClass:"px-6 py-4 flex items-center",attrs:{href:"/admin/posts/"+t.post.id+"/edit",tabindex:"-1"}},[t.post.organization?e("div",[t._v("\n              "+t._s(t.post.slug)+"\n            ")]):t._e()])],1),t._v(" "),e("td",{staticClass:"border-t"},[e("inertia-link",{staticClass:"px-6 py-4 flex items-center",attrs:{href:"/admin/posts/"+t.post.id+"/edit",tabindex:"-1"}},[t._v("\n            "+t._s(t.post.createdDate)+"\n          ")])],1),t._v(" "),e("td",{staticClass:"border-t w-px"},[e("inertia-link",{staticClass:"px-4 flex items-center",attrs:{href:"/admin/posts/"+t.post.id+"/edit",tabindex:"-1"}},[e("icon",{staticClass:"block w-6 h-6 fill-grey",attrs:{name:"cheveron-right"}})],1)],1)])})),t._v(" "),0===t.posts.data.length?e("tr",[e("td",{staticClass:"border-t px-6 py-4",attrs:{colspan:"4"}},[t._v("No posts found.")])]):t._e()],2)]),t._v(" "),e("pagination",{attrs:{links:t.posts.links}})],1)}),[function(){var t=this.$createElement,s=this._self._c||t;return s("tr",{staticClass:"text-left font-bold"},[s("th",{staticClass:"px-6 pt-6 pb-4"},[this._v("Title")]),this._v(" "),s("th",{staticClass:"px-6 pt-6 pb-4"},[this._v("Slug")]),this._v(" "),s("th",{staticClass:"px-6 pt-6 pb-4"},[this._v("Created Date")]),this._v(" "),s("th",{staticClass:"px-6 pt-6 pb-4",attrs:{colspan:"2"}},[this._v("Phone")])])}],!1,null,null,null);s.default=d.exports}}]);
//# sourceMappingURL=Posts-Index.7169daed0159f33bbbd9.js.map