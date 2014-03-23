'use strict'

angular.module('realEstateFrontEndApp')
  .directive('myModalForm', () ->
    templateUrl: '/views/templates/mymodalform.html'
    restrict: 'E'
    transclude: true
    scope:
      modalButton: '@'
  )
