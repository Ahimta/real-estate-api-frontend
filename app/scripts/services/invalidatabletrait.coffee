'use strict'

angular.module('realEstateFrontEndApp')
  .service 'InvalidatableTrait', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope, model, mainResource, otherResources, records) ->
      () ->
        for record in records
          scope[record] = {}

        scope[resource] = undefined for resource in otherResources
        scope[mainResource] = undefined

        model.all(page: scope.page).then (response) ->
          data = response.data
          scope[mainResource] = data[mainResource]
          scope.pagination = data.meta.pagination
          scope.page = data.meta.pagination.page

          for resource in otherResources
            scope[resource] = data.meta.parents[resource]
