'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, Utils, Trade, Shop, Worker) ->
    Utils.makeSelectable $scope, 'Trade', (id) ->
      $scope.workers = undefined
      Worker.all (data, headers) ->
        if id is undefined
          $scope.workers = data
        else
          $scope.workers = _.filter data, (worker) ->
            worker.trade_id == id

    Utils.makeSelectable $scope, 'Shop', (id) ->
      $scope.workers = undefined
      Worker.all (data, headers) ->
        if id is undefined
          $scope.workers = data
        else
          $scope.workers = _.filter data, (worker) ->
            worker.shop_id == id


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
