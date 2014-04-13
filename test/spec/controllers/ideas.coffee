'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $httpBackend, REALESTATEAPI) ->
    scope = $rootScope.$new()
    $controller 'IdeasCtrl', {
      $scope: scope
    }

        
    it 'initial state', (done) ->
      othersRecords  = _.map [1..(otherResources.length)], (i) ->
        [{a:i,b:i+1}]

      records = [{x:1,b:2}]

      for [collection, url] in _.zip(othersRecords, otherUrls)
        httpBackend.whenGET(url).respond collection

      httpBackend.whenGET(mainUrl).respond records

      expect(scope[mainResource]).toBe undefined
      expect(scope[resource]).toBe undefined for resource in otherResources

      window.setTimeout () ->
        expect(false).toBe true
        expect(angular.equals(scope[mainResource], records)).toBe true
        for [collection, resource] in _.zip(othersRecords, otherResources)
          expect(angular.equals(scope[resource], collection)).toBe true

        done()

      httpBackend.flush()

  window.MyApp.itBehavesLike 'Selectable', 'IdeasCtrl', ['Trade']
  window.MyApp.itBehavesLike 'Crudable', 'IdeasCtrl', 'ideas', ['trades']
