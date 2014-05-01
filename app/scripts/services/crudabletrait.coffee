'use strict'

angular.module('realEstateFrontEndApp')
  .service 'CrudableTrait', ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope, model, invalidator) ->
      f = (response) ->
        invalidator()
        response

      scope.create = (record) ->
        model.create(record)
          .then(f)
          .catch (response) ->
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
