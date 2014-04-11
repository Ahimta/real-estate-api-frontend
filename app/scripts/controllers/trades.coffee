'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $log, Trade, Utils) ->
    
    invalidate = Utils.makeInvalidate $scope, [Trade], ['trades'], ['trade']

    invalidate()

    Utils.makeCrudable $scope, Trade, invalidate
