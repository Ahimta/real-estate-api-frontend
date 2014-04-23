'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $routeParams, Trade, ControllersTraits) ->

    invalidator = ControllersTraits.Crudable($scope, Trade, 'trades',
      [], ['trade'], $routeParams)

    invalidator()
