'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $log, Trade) ->
    $scope.trades = Trade.all()
    isEditing     = {}

    $scope.create = (trade) ->
      Trade.create trade, (data, headers) ->
        $scope.trades = Trade.all()
        $scope.trade  = {}

    $scope.destroy = (id) ->
      Trade.destroy id, (data, headers) ->
        $scope.trades = Trade.all()

    $scope.update = (trade) ->
      Trade.update trade, (data, headers) ->
        $scope.trades = Trade.all()
        isEditing[trade.id] = false

    $scope.isEditing = (id) ->
      isEditing[id]

    $scope.edit = (id) ->
      setEditing(id, true)

    $scope.reset = (id) ->
      setEditing(id, false)

    setEditing = (id, bool) ->
      isEditing[id] = bool
