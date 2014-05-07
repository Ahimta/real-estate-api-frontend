'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope,$location,$translate,TranslatableTrait) ->

    TranslatableTrait $scope

    $scope.isActive = (path) ->
      "##{$location.path()}" == path

    $scope.items = [
      {
        name: 'TRADES.PLURAL'
        path: '#/trades'
      },
      {
        name: 'SHOPS.PLURAL'
        path: '#/shops'
      },
      {
        name: 'WORKERS.PLURAL'
        path: '#/workers'
      },
      {
        name: 'IDEAS.PLURAL'
        path: '#/ideas'
      }
    ]
