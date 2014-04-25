'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, $routeParams, Idea, Trade, ControllersTraits) ->

    ControllersTraits.Selectable $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Idea, 'ideas',
      ['trades'], ['idea'], $routeParams)

    invalidator()
