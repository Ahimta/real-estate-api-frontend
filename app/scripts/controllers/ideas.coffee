'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope, Idea, Trade, Utils) ->

    Utils.makeSelectable $scope, 'Trade', Idea, 'ideas'

    invalidate = Utils.makeInvalidate($scope, [Trade, Idea], ['trades', 'ideas'], ['idea'])
    invalidate()

    Utils.makeCrudable $scope, Idea, invalidate
