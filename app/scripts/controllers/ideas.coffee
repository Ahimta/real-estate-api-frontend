'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade) ->
  
    $scope.trades = Trade.all()
    $scope.ideas  = Idea.all()

    $scope.getTrade = (id) ->
      _.find $scope.trades, (trade) ->
        trade.id == id

    $scope.create = (idea) ->
      Idea.create idea, (data, headers) ->
        $scope.trades = Trade.all()
        $scope.ideas  = Idea.all()
        $scope.idea = {}
        idea = {}

    $scope.destroy = (id) ->
      Idea.destroy id, () ->
        $scope.trades = Trade.all()
        $scope.ideas  = Idea.all()
