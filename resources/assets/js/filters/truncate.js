import Vue from 'vue';

Vue.filter('truncate', function (value) {
  return value.replace(/<\/?[^>]+>/ig, " ").substring(0,280)+"..."
})

