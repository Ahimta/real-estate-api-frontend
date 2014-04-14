'use strict'

angular.module('realEstateFrontEndApp')
  .service 'ControllersTraits', ->
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

      scope.create2 = (record) ->
        model.create2(record).then (response) ->
          invalidator()

      scope.update2 = (record) ->
        model.update2(record).then (response) ->
          invalidator()

      scope.destroy2 = (id) ->
        model.destroy(id).then (response) ->
          invalidator()

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

    Invalidatable = (scope, models, collections, records) ->
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

    makeSelectable = (scope, name) ->
      selectedId     = undefined
      isSelectedName = "is#{name}Selected"
      selectedName   = "selected#{name}"
      selectName     = "select#{name}"

      scope[selectName] = (id) ->
        selectedId = if selectedId == id then undefined else id
        scope[selectedName] = selectedId

      scope[isSelectedName] = (id) ->
        id == selectedId

    Selectable: (scope, names...) ->
      makeSelectable(scope, name) for name in names

    Crudable: (scope, mainModel, models, collections, records) ->
      invalidator = Invalidatable(scope, models, collections, records)
      makeCrudable(scope, mainModel, invalidator)
      invalidator
