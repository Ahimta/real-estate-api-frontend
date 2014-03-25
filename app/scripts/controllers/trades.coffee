'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $log, Trade, Utils) ->
    Utils.makeEditible $scope

    $scope.trades = Trade.all()

    $scope.create = (trade) ->
      Trade.create trade, (data, headers) ->
        $scope.trades = Trade.all()
        $scope.trade = {}
        trade  = {}

    $scope.destroy = (id) ->
      Trade.destroy id, (data, headers) ->
        $scope.trades = Trade.all()

    $scope.update = (trade) ->
      $scope.reset trade.id

      Trade.update trade, (data, headers) ->
        $scope.trades = Trade.all()
