'use strict'

angular.module('realEstateFrontEndApp')
  .service 'PaginatableTrait', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope, model, mainResource, otherResources, routeParams) ->
      isGettingNextPage = false

      scope.isLastPage = ->
        scope.pagination is undefined or
          scope.pagination.page >= scope.pagination.pages

      scope.nextPage = ->
        if isGettingNextPage or scope.pagination is undefined then false
        else
          isGettingNextPage = true

          model.all(_.extend(routeParams, {page: scope.pagination.page + 1}))
            .then (response) ->
              scope.pagination = response.data.meta.pagination

              scope[mainResource].push response.data[mainResource]...
              isGettingNextPage = false
