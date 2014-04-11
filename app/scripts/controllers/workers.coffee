'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, ControllersTraits, Trade, Shop, Worker) ->
    ControllersTraits.Selectable $scope, 'Trade', Worker, 'workers', 'trade_id'
    ControllersTraits.Selectable $scope, 'Shop', Worker, 'workers', 'shop_id'


    invalidator = ControllersTraits.Crudable($scope, Worker, [Trade, Shop, Worker],
      ['trades', 'shops', 'workers'], ['worker'])

    
    invalidator()
