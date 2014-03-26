'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $log, Trade, Utils) ->
    Utils.makeEditible $scope

    invalidate = () ->
      $scope.trades = undefined
      $scope.trade  = {}

      Trade.all (data) ->
        $scope.trades = data

    invalidate()

    $scope.create = (trade) ->
      Trade.create trade, invalidate

    $scope.destroy = (id) ->
      Trade.destroy id, invalidate

    $scope.update = (trade) ->
      $scope.reset trade.id

      Trade.update trade, invalidate
