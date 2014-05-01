'use strict'

angular.module('realEstateFrontEndApp')
  .service 'ControllersTraits', ($log, $locale, $translate) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    Invalidatable = (scope, model, mainResource, otherResources, records) ->
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

    makeCrudable: (scope, model, invalidator) ->
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

      scope.getShop = (id) ->
        _.find scope.shops, (shop) ->
          shop.id == id


    Crudable: (scope, mainModel, mainResource, otherResources, records, routeParams) ->
      scope.page = routeParams.page

      invalidator = Invalidatable(scope, mainModel, mainResource,
        otherResources, records)

      @makeCrudable(scope, mainModel, invalidator)
      invalidator
