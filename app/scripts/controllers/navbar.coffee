'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope, $location, $translate) ->

    $scope.isActive = (path) ->
      "##{$location.path()}" == path

    $translate(['TRADES.PLURAL','SHOPS.PLURAL','IDEAS.PLURAL','WORKERS.PLURAL'])
      .then (translations) ->
        $scope.items = [
          {
            name: translations['TRADES.PLURAL']
            path: '#/trades'
          },
          {
            name: translations['SHOPS.PLURAL']
            path: '#/shops'
          },
          {
            name: translations['WORKERS.PLURAL']
            path: '#/workers'
          },
          {
            name: translations['IDEAS.PLURAL']
            path: '#/ideas'
          }
        ]
