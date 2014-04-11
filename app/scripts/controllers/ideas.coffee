'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, ControllersTraits) ->

    ControllersTraits.Selectable $scope, 'Trade', Idea, 'ideas'

    invalidator = ControllersTraits.Invalidatable($scope, [Trade, Idea], ['trades', 'ideas'], ['idea'])
    invalidator()

    ControllersTraits.Crudable $scope, Idea, invalidator
