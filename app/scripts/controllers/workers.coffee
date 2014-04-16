'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, ControllersTraits, Trade, Shop, Worker) ->

    ControllersTraits.Selectable $scope, 'Trade', 'Shop'

    invalidator = ControllersTraits.Crudable($scope, Worker, 'workers',
    	['trades', 'shops'], ['worker'])

    invalidator()
