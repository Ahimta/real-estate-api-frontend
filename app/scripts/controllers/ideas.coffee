'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade) ->
  
    $scope.trades = Trade.all()

    $scope.create = () ->
      Idea.create $scope.idea, (data, headers) ->
        $scope.idea = {}
        $scope.trades = Trade.all()

    $scope.destroy = (id) ->
      Idea.destroy id, () ->
        $scope.trades = Trade.all()
