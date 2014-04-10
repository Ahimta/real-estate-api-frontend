'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, Utils) ->

    Utils.makeSelectable $scope, 'Trade', Idea, 'ideas'


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
