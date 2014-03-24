'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Utils', ($log, $resource, REALESTATEAPI) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    generateSimpleResource: (name) ->
      service = $resource "#{REALESTATEAPI}/#{name}/:id",
        {id: '@id'}, {'update': {method: 'PUT'}}

      all: (callbacks) ->
        service.query callbacks

      create: (resource, callbacks) ->
        $log.debug resource
        service.save resource, callbacks

      update: (resource, callbacks) ->
        $log.debug resource
        service.update resource.id, resource, callbacks

      destroy: (id, callbacks) ->
        service.delete {id: id}, callbacks
