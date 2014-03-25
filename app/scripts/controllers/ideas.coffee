'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, Utils) ->
    Utils.makeEditible $scope
  
    $scope.trades = Trade.all()
    $scope.ideas  = Idea.all()

    _selectedTrade = -1

    $scope.selectTrade = (id) ->
      _selectedTrade = id
      $scope.ideas = []
      Idea.all (data, headers) ->
        $scope.ideas = _.filter data, (idea) ->
          idea.trade_id == id


    $scope.isTradeSelected = (id) ->
      id == _selectedTrade

    $scope.getTrade = (id) ->
      _.find $scope.trades, (trade) ->
        trade.id == id

    $scope.create = (idea) ->
      Idea.create idea, (data, headers) ->
        $scope.trades = Trade.all()
        $scope.ideas  = Idea.all()
        $scope.idea = {}
        idea = {}

    $scope.update = (idea) ->
      $scope.reset idea.id

      Idea.update idea, (data, headers) ->
        $scope.trades = Trade.all()
        $scope.ideas = Idea.all()

    $scope.destroy = (id) ->
      Idea.destroy id, (data, headers) ->
        $scope.trades = Trade.all()
        $scope.ideas  = Idea.all()
