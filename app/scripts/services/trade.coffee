'use strict'

angular.module('realEstateFrontEndApp')
  .factory 'Trade', ($resource) ->
    service = $resource 'https://realestate-api.herokuapp.com/trades/:id',
      {id: '@id'}, {'update': {method: 'PUT'}}

    # Public API here
    {
      all: (callbacks) ->
        service.query callbacks

      create: (trade, callbacks) ->
        service.save trade, callbacks

      update: (trade, callbacks) ->
        service.update trade.id, trade, callbacks

      destroy: (id, callbacks) ->
        service.delete {id: id}, callbacks
    }
