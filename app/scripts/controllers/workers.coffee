'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, $routeParams,
    ControllersTraits, Trade, Shop, Worker, EditableTrait) ->

    EditableTrait $scope

    ControllersTraits.Selectable $scope, 'Trade', 'Shop'

    invalidator = ControllersTraits.Crudable($scope, Worker, 'workers',
    	['trades', 'shops'], ['worker'], $routeParams)

    invalidator()
