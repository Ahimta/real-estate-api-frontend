'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, $routeParams, Idea, Trade,
    ControllersTraits, EditableTrait, SelectableTrait) ->

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Idea, 'ideas',
      ['trades'], ['idea'], $routeParams)

    invalidator()
