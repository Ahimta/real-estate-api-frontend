'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, $routeParams, ControllersTraits,
    Trade, Shop, EditableTrait, SelectableTrait) ->

    EditableTrait $scope

    SelectableTrait $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Shop, 'shops',
      ['trades'], ['shop'], $routeParams)

    invalidator()
