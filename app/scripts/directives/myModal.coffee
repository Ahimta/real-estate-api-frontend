'use strict'

angular.module('realEstateFrontEndApp')
  .directive('myModal', () ->
    templateUrl: '/scripts/templates/myModal.html'
    restrict: 'E'
    transclude: true
    scope:
      modalButton: '='
  )
