'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, ControllersTraits, Trade, Shop) ->
    
    ControllersTraits.Selectable $scope, 'Trade', Shop, 'shops'

    invalidator = ControllersTraits.Crudable($scope, Shop, [Trade, Shop],
      ['trades', 'shops'], ['shop'])
    
    invalidator()
