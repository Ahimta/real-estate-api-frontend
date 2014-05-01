'use strict'

angular.module('realEstateFrontEndApp')
  .service 'SelectableTrait', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope, names...) ->
      for name in names
        isSelectedName = "is#{name}Selected"
        selectedName   = "selected#{name}"
        selectName     = "select#{name}"
        selectedId     = undefined

        scope[selectName] = (id) ->
          selectedId = if selectedId == id then undefined else id
          scope[selectedName] = selectedId

        scope[isSelectedName] = (id) ->
          id == selectedId
