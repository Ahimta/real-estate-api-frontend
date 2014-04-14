'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Utils', ($log, REALESTATEAPI, $http) ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    generateSimpleResource: (name) ->
      resource = "#{REALESTATEAPI}/#{name}"

      all: () ->
        $http.get resource

      create: (record) ->
        $http.post resource, record

      update: (record) ->
        $http.put "#{resource}/#{record.id}", record

      destroy: (id) ->
        $http.delete "#{resource}/#{id}"
