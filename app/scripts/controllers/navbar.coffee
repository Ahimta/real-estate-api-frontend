'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope, $location, $log) ->
    
    $scope.isActive = (path) ->
      "##{$location.url()}" == path

    $scope.items =
      trades:
        name: 'الفئات'
        path: '#/trades'
      ideas:
        name: 'الأفكار'
        path: '#/ideas'
