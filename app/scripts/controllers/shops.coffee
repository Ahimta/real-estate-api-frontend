'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, Utils, Trade, Shop) ->
    
    Utils.makeSelectable $scope, 'Trade', Shop, 'shops'


    invalidate = Utils.makeInvalidate($scope, [Trade, Shop], ['trades', 'shops'], ['shop'])
    invalidate()

    Utils.makeCrudable $scope, Shop, invalidate
