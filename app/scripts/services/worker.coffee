'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Worker', (Utils) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    Utils.generateSimpleResource 'workers'
