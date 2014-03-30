'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Utils', ($log, $resource, REALESTATEAPI) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    makeEditible = (scope) ->
      _isEditing = {}

      scope.edit = (id) ->
        _isEditing[id] = true

      scope.isEditing = (id) ->
        _isEditing[id]

      scope.reset = (id) ->
        _isEditing[id] = false


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

    makeSelectable: (scope, callback) ->
      _selectedItem = undefined

      scope.select = (id) ->
        _selectedItem = if _selectedItem == id then undefined else id
        callback(_selectedItem)


      scope.isSelected = (id) ->
        id == _selectedItem

    makeCrudable: (scope, model, invalidate) ->
      makeEditible scope

      scope.create = (record) ->
        model.create record, invalidate

      scope.update = (record) ->
        scope.reset record.id
        model.update record, invalidate

      scope.destroy = (id) ->
        model.destroy id, invalidate

      scope.getTrade = (id) ->
        _.find scope.trades, (trade) ->
          trade.id == id
