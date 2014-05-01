'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, ControllersTraits,
    EditableTrait, SelectableTrait, TranslatableTrait, PaginatableTrait,
    InvalidatableTrait, CrudableTrait) ->

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = InvalidatableTrait $scope, Idea, 'ideas', ['trades'], ['idea']

    CrudableTrait $scope, Idea, invalidator

    PaginatableTrait $scope, Idea, 'ideas', ['trades']

    invalidator()
