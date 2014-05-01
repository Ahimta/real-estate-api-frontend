'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, $routeParams, SelectableTrait,
    ControllersTraits, Trade, Shop, Worker, EditableTrait,
    TranslatableTrait) ->

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade', 'Shop'

    invalidator = ControllersTraits.Crudable($scope, Worker, 'workers',
    	['trades', 'shops'], ['worker'], $routeParams)

    invalidator()
