'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, Utils, Trade, Shop, Worker) ->
    Utils.makeSelectable $scope, 'Trade', Worker, 'workers', 'trade_id'
    Utils.makeSelectable $scope, 'Shop', Worker, 'workers', 'shop_id'


    invalidate = Utils.makeInvalidate($scope, [Trade, Shop, Worker],
      ['trades', 'shops', 'workers'], ['worker'])

    
    invalidate()

    Utils.makeCrudable $scope, Worker, invalidate
