'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'ShopsCtrl', ($scope, $routeParams, ControllersTraits, Trade, Shop) ->

    ControllersTraits.Selectable $scope, 'Trade'

    invalidator = ControllersTraits.Crudable($scope, Shop, 'shops',
      ['trades'], ['shop'], $routeParams)

    invalidator()
