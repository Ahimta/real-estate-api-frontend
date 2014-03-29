'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Shop', (Utils) ->
    Utils.generateSimpleResource 'shops'
