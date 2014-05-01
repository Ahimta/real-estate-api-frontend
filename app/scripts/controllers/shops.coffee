'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, $routeParams, ControllersTraits,
    Trade, Shop, EditableTrait, SelectableTrait, TranslatableTrait,
    PaginatableTrait) ->

    PaginatableTrait $scope, Shop, 'shops', ['trades']

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Shop, 'shops',
      ['trades'], ['shop'], $routeParams)

    invalidator()
