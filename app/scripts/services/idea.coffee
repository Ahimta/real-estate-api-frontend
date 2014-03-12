'use strict'

angular.module('realEstateFrontEndApp')
  .factory 'Idea', ($resource, Trade) ->
    service = $resource 'https://realestate-api.herokuapp.com/ideas/:id',
      {id: '@id'}, {'update': {method: 'PUT'}}

    # Public API here
    {
      all: () ->
        service.query (-> null), (-> null)


      create: (idea, callbacks) ->
        service.save idea, callbacks

      update: (idea, callbacks) ->
        service.update idea.id, idea, callbacks, (-> null)

      destroy: (id, callback) ->
        service.delete {id: id}, callback, (-> null)
    }
