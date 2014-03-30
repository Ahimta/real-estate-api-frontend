'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, Utils) ->

    Utils.makeSelectable $scope, (id) ->
      $scope.ideas = undefined
      Idea.all (data, headers) ->
        if id is undefined
          $scope.ideas = data
        else
          $scope.ideas = _.filter data, (idea) ->
            idea.trade_id == id


    invalidate = () ->
      $scope.trades = undefined
      $scope.ideas  = undefined
      $scope.idea  = {}

      Trade.all (data, headers) ->
        $scope.trades = data

      Idea.all (data, headers) ->
        $scope.ideas = data

    
    invalidate()

    Utils.makeCrudable $scope, Idea, invalidate
