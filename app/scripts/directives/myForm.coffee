'use strict'

angular.module('realEstateFrontEndApp')
  .directive('myForm', () ->
    templateUrl: '/scripts/templates/myForm.html'
    restrict: 'E'
    transclude: true
    scope:
      modalButton: '='
  )
