'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Trade', (Utils) ->
    Utils.generateSimpleResource 'trades'
