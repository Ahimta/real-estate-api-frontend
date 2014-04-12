'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, ControllersTraits) ->

    ControllersTraits.Selectable $scope, 'Trade', Idea, 'ideas'
    
    invalidator = ControllersTraits.Crudable($scope, Idea, [Trade, Idea],
      ['trades', 'ideas'], ['idea'])
    
    invalidator()
