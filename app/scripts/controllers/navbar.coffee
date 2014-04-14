'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope, $location) ->
    
    $scope.isActive = (path) ->
      "##{$location.url()}" == path

    $scope.items = [
      {
        name: 'Trades'
        path: '#/trades'
      },
      {
        name: 'Shops'
        path: '#/shops'
      },
      {
        name: 'Workers'
        path: '#/workers'
      },
      {
        name: 'Ideas'
        path: '#/ideas'
      }
      # materials:
      #   name: 'Materials'
      #   path: '#/materials'
    ]

    console.log $scope.items
