'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, ControllersTraits, Trade, Shop, Worker) ->

    ControllersTraits.Selectable $scope, 'Trade', 'Shop'

    invalidator = ControllersTraits.Crudable($scope, Worker,
      [Trade, Shop, Worker], ['trades', 'shops', 'workers'], ['worker'])

    invalidator()
