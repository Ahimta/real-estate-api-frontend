'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, $routeParams, CrudableTrait,
    Trade, Shop, EditableTrait, SelectableTrait, TranslatableTrait,
    PaginatableTrait, InvalidatableTrait) ->

    PaginatableTrait $scope, Shop, 'shops', ['trades']

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = InvalidatableTrait $scope, Shop, 'shops', ['trades'], ['shop']

    CrudableTrait $scope, Shop, invalidator

    invalidator()
