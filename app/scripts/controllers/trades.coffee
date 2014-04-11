'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, Trade, ControllersTraits) ->
    
    invalidator = ControllersTraits.Crudable $scope, Trade, [Trade], ['trades'], ['trade']
    invalidator()
