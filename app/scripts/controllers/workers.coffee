'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'WorkersCtrl', ($scope, $routeParams, CrudableTrait, SelectableTrait,
    ControllersTraits, Trade, Shop, Worker, EditableTrait,
    TranslatableTrait, PaginatableTrait, InvalidatableTrait) ->

    PaginatableTrait $scope, Worker, 'workers', ['trades', 'shops']

    TranslatableTrait $scope

    EditableTrait $scope

    SelectableTrait $scope, 'Trade', 'Shop'

    invalidator = InvalidatableTrait($scope, Worker, 'workers',
      ['trades', 'shops'], ['worker'], $routeParams)

    CrudableTrait $scope, Worker, invalidator

    invalidator()
