'use strict'

angular.module('realEstateFrontEndApp')
  .service 'ControllersTraits', ($log, $locale, $translate) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    makeCrudable = (scope, model, invalidator) ->
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


    makePaginatable = (scope, model, mainResource, otherResources) ->
      _isGettingNextPage = false

      scope.isLastPage = ->
        scope.pagination is undefined or
          scope.pagination.page >= scope.pagination.pages

      scope.nextPage = ->
        if _isGettingNextPage then return
        else
          _isGettingNextPage = true

          model.all(page: scope.pagination.page + 1).then (response) ->
            scope.pagination = response.data.meta.pagination

            scope[mainResource].push response.data[mainResource]...
            _isGettingNextPage = false

      scope.isGettingNextPage = ->
        _isGettingNextPage

    Translatable: (scope) ->
      $translate.use switch $locale.id[0..1]
        when 'ar' then 'ar'
        else 'en'


    Crudable: (scope, mainModel, mainResource, otherResources, records, routeParams) ->
      @Translatable scope
      scope.page = routeParams.page
      makePaginatable(scope, mainModel, mainResource, otherResources)

      invalidator = Invalidatable(scope, mainModel, mainResource,
        otherResources, records)

      makeCrudable(scope, mainModel, invalidator)
      invalidator
