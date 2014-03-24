'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Idea', (Utils) ->
    Utils.generateSimpleResource 'ideas'
