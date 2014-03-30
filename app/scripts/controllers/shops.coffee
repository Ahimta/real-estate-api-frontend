'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, Utils, Trade, Shop) ->
    
    Utils.makeSelectable $scope, (id) ->
      $scope.shops = undefined
      Shop.all (data, headers) ->
        if id is undefined
          $scope.shops = data
        else
          $scope.shops = _.filter data, (shop) ->
            shop.trade_id == id


    invalidate = () ->
      $scope.trades = undefined
      $scope.shops  = undefined
      $scope.shop   = {}

      Trade.all (data, headers) ->
        $scope.trades = data

      Shop.all (data, headers) ->
        $scope.shops = data

    
    invalidate()

    Utils.makeCrudable $scope, Shop, invalidate
