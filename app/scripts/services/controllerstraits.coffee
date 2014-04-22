'use strict'

angular.module('realEstateFrontEndApp')
  .service 'ControllersTraits', ($log) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    makeEditible = (scope) ->
      _isEditing = {}

      scope.edit = (id) ->
        _isEditing[id] = true

      scope.isEditing = (id) ->
        _isEditing[id] is true

      scope.reset = (id) ->
        _isEditing[id] = false


    makeCrudable = (scope, model, invalidator) ->
      makeEditible scope
      f = (response) ->
        invalidator()
        response

      scope.create = (record) ->
        model.create(record)
          .then(f)
          .catch (response) ->
            $log.debug response
            scope.errors = response.data

      scope.update = (record) ->
        scope.reset record.id

        model.update(record)
          .then(f)

      scope.destroy = (id) ->
        model.destroy(id)
          .then(f)

      scope.getTrade = (id) ->
        _.find scope.trades, (trade) ->
          trade.id == id


    Invalidatable = (scope, model, mainResource, otherResources, records) ->
      () ->
        for record in records
          scope[record] = {}

        scope[resource] = undefined for resource in otherResources
        scope[mainResource] = undefined

        model.all().then (response) ->
          data = response.data
          scope[mainResource] = data[mainResource]

          for resource in otherResources
            scope[resource] = data.meta.parents[resource]


    makeSelectable = (scope, name) ->
      isSelectedName = "is#{name}Selected"
      selectedName   = "selected#{name}"
      selectName     = "select#{name}"
      selectedId     = undefined

      scope[selectName] = (id) ->
        selectedId = if selectedId == id then undefined else id
        scope[selectedName] = selectedId

      scope[isSelectedName] = (id) ->
        id == selectedId


    Selectable: (scope, names...) ->
      makeSelectable(scope, name) for name in names


    Crudable: (scope, mainModel, mainResource, otherResources, records) ->
      invalidator = Invalidatable(scope, mainModel, mainResource,
        otherResources, records)

      makeCrudable(scope, mainModel, invalidator)
      invalidator
