'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, $routeParams, Idea, Trade,
    ControllersTraits, EditableTrait, SelectableTrait,
    TranslatableTrait) ->

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Idea, 'ideas',
      ['trades'], ['idea'], $routeParams)

    invalidator()
