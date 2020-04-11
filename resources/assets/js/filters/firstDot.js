import Vue from 'vue';

Vue.filter('firstDot', function (value) {
  return value.split('.')[0] + '.'
})