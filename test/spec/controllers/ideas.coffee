'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  IdeasCtrl = {}
  httpBackend = undefined
  API = undefined
  timeout = undefined
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $httpBackend, REALESTATEAPI,
    $timeout) ->
    timeout = $timeout
    API = REALESTATEAPI
    scope = $rootScope.$new()
    IdeasCtrl = $controller 'IdeasCtrl', {
      $scope: scope
    }
    httpBackend = $httpBackend

  describe 'Crudable', () ->
    afterEach () ->
      httpBackend.verifyNoOutstandingExpectation()
      httpBackend.verifyNoOutstandingRequest()
    
    it 'initial state', (done) ->
      trades = [{a:1,b:2}]
      ideas  = [{x:1,b:2}]

      httpBackend.whenGET("#{API}/trades").respond trades
      httpBackend.whenGET("#{API}/ideas").respond ideas

      expect(scope.trades).toBe undefined
      expect(scope.ideas).toBe undefined

      window.setTimeout () ->
        expect(angular.equals(scope.ideas, ideas)).toBe true
        window.setTimeout () ->
          expect(angular.equals(scope.trades, trades)).toBe true
          done()

      httpBackend.flush()
