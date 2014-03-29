'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, Utils, Trade, Shop) ->
    
    Utils.makeEditible $scope
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

    $scope.getTrade = (id) ->
      _.find $scope.trades, (trade) ->
        trade.id == id

    $scope.create = (shop) ->
      Shop.create shop, invalidate
        

    $scope.update = (shop) ->
      $scope.reset shop.id
      Shop.update shop, invalidate

    $scope.destroy = (id) ->
      Shop.destroy id, invalidate
