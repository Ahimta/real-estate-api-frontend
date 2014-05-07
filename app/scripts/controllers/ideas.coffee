'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, $routeParams, Idea, Trade,
    EditableTrait, SelectableTrait, TranslatableTrait, PaginatableTrait,
    InvalidatableTrait, CrudableTrait) ->

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = InvalidatableTrait($scope, Idea, 'ideas', ['trades'],
      ['idea'], $routeParams)

    CrudableTrait $scope, Idea, invalidator

    PaginatableTrait $scope, Idea, 'ideas', ['trades']

    invalidator()
