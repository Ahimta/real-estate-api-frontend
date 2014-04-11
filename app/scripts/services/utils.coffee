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
      _service = $resource "#{REALESTATEAPI}/#{name}/:id",
        {id: '@id'}, {'update': {method: 'PUT'}}

      all: (callbacks) ->
        _service.query callbacks

      create: (resource, callbacks) ->
        $log.debug resource
        _service.save resource, callbacks

      update: (resource, callbacks) ->
        $log.debug resource
        _service.update resource.id, resource, callbacks

      destroy: (id, callbacks) ->
        _service.delete {id: id}, callbacks


    makeSelectable: (scope, name, service, collection, fkey='trade_id') ->
      selectedId     = undefined
      isSelectedName = "is#{name}Selected"
      selectedName   = "selected#{name}"
      selectName     = "select#{name}"

      scope[selectName] = (id) ->
        selectedId = if selectedId == id then undefined else id
        scope[selectedName] = selectedId

      scope[isSelectedName] = (id) ->
        id == selectedId


    makeCrudable: (scope, model, invalidator) ->
      makeEditible scope

      scope.create = (record) ->
        model.create record, invalidator

      scope.update = (record) ->
        scope.reset record.id
        model.update record, invalidator

      scope.destroy = (id) ->
        model.destroy id, invalidator

      scope.getTrade = (id) ->
        _.find scope.trades, (trade) ->
          trade.id == id

    makeInvalidate: (scope, models, collections, records) ->
      f = (model, collection) ->
        scope[collection] = undefined
        
        model.all (data, status) ->
          scope[collection] = data

      zipped = _.zip(models, collections)

      () ->
        for record in records
          scope[record] = {}

        for [model, collection] in zipped
          f(model, collection)
