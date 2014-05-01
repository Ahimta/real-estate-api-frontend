'use strict'

angular.module('realEstateFrontEndApp')
  .service 'EditableTrait', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->
      _isEditing = {}

      scope.edit = (id) ->
        _isEditing[id] = true

      scope.isEditing = (id) ->
        _isEditing[id] is true

      scope.reset = (id) ->
        _isEditing[id] = false

