'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope) ->
    $scope.trades = ({id:i,name:"name#{i}", description:"description#{i}",ideas_count:i} for i in [1..7])
