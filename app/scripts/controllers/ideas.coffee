'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade) ->
  
    $scope.trades = Trade.all()

    $scope.create = (idea) ->
      Idea.create idea, afterCreate

    $scope.destroy = (id) ->
      Idea.destroy id, invalidate

    afterCreate = (data, headers) ->
      $scope.idea = {}
      invalidate()

    invalidate = ->
      $scope.trades = Trade.all()
