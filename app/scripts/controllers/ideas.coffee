'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, Utils) ->

    Utils.makeEditible $scope
    Utils.makeSelectable $scope, (id) ->
      $scope.ideas = undefined
      Idea.all (data, headers) ->
        $scope.ideas = _.filter data, (idea) ->
          idea.trade_id == id


    invalidate = ->
      $scope.trades = undefined
      $scope.ideas  = undefined
      $scope.idea  = {}

      Trade.all (data, headers) ->
        $scope.trades = data

      Idea.all (data, headers) ->
        $scope.ideas = data

    
    invalidate()

    $scope.getTrade = (id) ->
      _.find $scope.trades, (trade) ->
        trade.id == id

    $scope.create = (idea) ->
      Idea.create idea, invalidate
        

    $scope.update = (idea) ->
      $scope.reset idea.id
      Idea.update idea, invalidate

    $scope.destroy = (id) ->
      Idea.destroy id, invalidate
