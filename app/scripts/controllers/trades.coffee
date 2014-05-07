'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, $routeParams, CrudableTrait, Trade,
    EditableTrait, TranslatableTrait, InvalidatableTrait,
    PaginatableTrait) ->

    PaginatableTrait $scope, Trade, 'trades', [], $routeParams

    TranslatableTrait $scope

    EditableTrait $scope

    invalidator = InvalidatableTrait($scope, Trade, 'trades', [], ['trade'],
      $routeParams)

    CrudableTrait $scope, Trade, invalidator

    invalidator()
