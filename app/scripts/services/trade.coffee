'use strict'

angular.module('realEstateFrontEndApp')
  .factory 'Trade', ($resource) ->
    service = $resource 'https://realestate-api.herokuapp.com/trades/:id',
      {id: '@id'}, {'update': {method: 'PUT'}}

    # Public API here
    {
      all: () ->
        service.query (-> null), (-> null)

      create: (trade, callbacks) ->
        service.save trade: trade, callbacks

      update: (trade, onSuccess) ->
        service.update trade.id, trade, onSuccess, (-> null)

      destroy: (id, onSuccess) ->
        service.delete {id: id}, onSuccess, (-> null)
    }
