'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope, $location) ->

    $scope.isActive = (path) ->
      "##{$location.path()}" == path

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
        name: 'Contractors'
        path: '#/workers'
      },
      {
        name: 'Ideas'
        path: '#/ideas'
      }
    ]
