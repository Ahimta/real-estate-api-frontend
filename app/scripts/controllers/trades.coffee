'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $log, Trade, Utils) ->
    
    invalidate = () ->
      $scope.trades = undefined
      $scope.trade  = {}

      Trade.all (data) ->
        $scope.trades = data

    invalidate()

    Utils.makeCrudable $scope, Trade, invalidate
