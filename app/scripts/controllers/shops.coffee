'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, Utils, Trade, Shop) ->
    
    Utils.makeSelectable $scope, 'Trade', Shop, 'shops'


    invalidate = () ->
      $scope.trades = undefined
      $scope.shops  = undefined
      $scope.shop   = {}

      Trade.all (data, headers) ->
        $scope.trades = data

      Shop.all (data, headers) ->
        $scope.shops = data

    
    #invalidate = Utils.makeInvalidate($scope, [Trade, Shop], ['trades', 'shops'], ['shop'])
    invalidate()

    Utils.makeCrudable $scope, Shop, invalidate
