'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope, $location) ->
    
    $scope.isActive = (path) ->
      "##{$location.url()}" == path

    $scope.items =
      trades:
        name: 'Trades'
        path: '#/trades'
      shops:
        name: 'Shops'
        path: '#/shops'
      workers:
        name: 'Workers'
        path: '#/workers'
      ideas:
        name: 'Ideas'
        path: '#/ideas'
      # materials:
      #   name: 'المواد'
      #   path: '#/materials'
