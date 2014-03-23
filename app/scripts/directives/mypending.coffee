'use strict'

angular.module('realEstateFrontEndApp')
  .directive('myPending', () ->
    templateUrl: '/views/templates/mypending.html'
    restrict: 'A'
    transclude: true
    scope:
      hideCondition: '='
  )
