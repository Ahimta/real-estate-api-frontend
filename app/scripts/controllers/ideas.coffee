'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade) ->
    $scope.trades = Trade.all()

    $scope.create = ->
      Idea.create $scope.idea, afterCreate

    $scope.destroy = (id) ->
      Idea.destroy id, invalidate

    $scope.trades_ids = -> _.map $scope.trades, (trade) -> trade.id

    afterCreate = (data, headers) ->
      invalidate()
      $scope.idea = {}

    invalidate = ->
      $scope.trades = Trade.all()
