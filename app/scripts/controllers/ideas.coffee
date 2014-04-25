'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, $routeParams, Idea, Trade, ControllersTraits) ->

    ControllersTraits.Selectable $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Idea, 'ideas',
      ['trades'], ['idea'], $routeParams)

    invalidator()

    $scope.isLastPage = ->
      unless $scope.pagination is undefined
        $scope.pagination.page >= $scope.pagination.pages

    $scope.nextPage = ->
      unless $scope.pagination is undefined
        Idea.all(page: $scope.pagination.page + 1).then (response) ->
          $scope.pagination = response.data.meta.pagination
          $scope.ideas.push response.data.ideas...
