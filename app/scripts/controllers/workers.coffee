'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, Utils, Trade, Shop, Worker) ->
    Utils.makeSelectable $scope, 'Trade', Worker, 'workers', 'shop_id'
    Utils.makeSelectable $scope, 'Shop', Worker, 'workers', 'shop_id'


    invalidate = () ->
      $scope.trades  = undefined
      $scope.shops   = undefined
      $scope.workers = undefined
      $scope.worker  = {}

      Trade.all (data, headers) ->
        $scope.trades = data

      Shop.all (data, headers) ->
        $scope.shops = data

      Worker.all (data, headers) ->
      	$scope.workers = data

    
    invalidate()

    Utils.makeCrudable $scope, Worker, invalidate
