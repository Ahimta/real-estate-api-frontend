'use strict'

angular.module('realEstateFrontEndApp')
  .service 'PaginatableTrait', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope, model, mainResource, otherResources=[]) ->
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
