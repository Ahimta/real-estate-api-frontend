'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'TradesCtrl', ($scope, CrudableTrait, Trade,
    EditableTrait, TranslatableTrait, InvalidatableTrait,
    PaginatableTrait) ->

    PaginatableTrait $scope, Trade, 'trades'

    TranslatableTrait $scope

    EditableTrait $scope

    invalidator = InvalidatableTrait $scope, Trade, 'trades', [], ['trade']

    CrudableTrait $scope, Trade, invalidator

    invalidator()
