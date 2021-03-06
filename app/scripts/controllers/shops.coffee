'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, $routeParams, CrudableTrait,
    Trade, Shop, EditableTrait, SelectableTrait, TranslatableTrait,
    PaginatableTrait, InvalidatableTrait) ->

    PaginatableTrait $scope, Shop, 'shops', ['trades'], $routeParams

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = InvalidatableTrait($scope, Shop, 'shops', ['trades'],
      ['shop'], $routeParams)

    CrudableTrait $scope, Shop, invalidator

    invalidator()
