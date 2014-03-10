'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'IdeasCtrl', ($scope) ->
    getIdeas = (id) ->
      _.filter ideas, (idea) -> idea.trade_id == id

    ideas = ({id:i,body:"idea#{i}", trade_id:i} for i in [1..7])
    $scope.trades = ({id:i,name:"name#{i}", description:"description#{i}", ideas:getIdeas(i)} for i in [1..7])
