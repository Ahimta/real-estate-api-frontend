'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, ControllersTraits,
    EditableTrait, SelectableTrait, TranslatableTrait, PaginatableTrait,
    InvalidatableTrait) ->

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = InvalidatableTrait $scope, Idea, 'ideas', ['trades'], ['idea']

    ControllersTraits.makeCrudable $scope, Idea, invalidator

    PaginatableTrait $scope, Idea, 'ideas', ['trades']

    # invalidator2 = ControllersTraits.Crudable($scope, Idea, 'ideas',
    #  ['trades'], ['idea'], $routeParams)

    invalidator()
