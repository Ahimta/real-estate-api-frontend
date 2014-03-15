'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $log, Trade) ->
    $scope.trades = Trade.all()

    $scope.create = () ->
      $log.debug $scope.trade
      Trade.create $scope.trade, afterCreate

    $scope.destroy = (id) ->
      Trade.destroy id, invalidate


    afterCreate = (data, headers) ->
      $scope.trade = {}
      invalidate()

    invalidate = ->
      $scope.trades = Trade.all()
