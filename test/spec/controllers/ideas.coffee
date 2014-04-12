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
    describe 'Editable', () ->
      it 'initial state', () ->
        expect(scope.isEditing(id)).toBe false for id in [1..31]

      it '.edit', () ->
        for id in [1..7]
          expect(scope.isEditing(id)).toBe false
          scope.edit id

          expect(scope.isEditing(i)).toBe true for i in [1..id]

          for i in [(id+1)..7] when id != 7
            expect(scope.isEditing(i)).toBe false
        
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

  describe 'Selectable', () ->
    it 'initial state', () ->
      expect(scope.selectedTrade).toBe undefined
      expect(scope.isTradeSelected(id)).toBe(false) for id in [1..31]

    it 'with one select', () ->
      scope.selectTrade 1

      expect(scope.selectedTrade).toBe 1
      expect(scope.isTradeSelected(1)).toBe true

    it 'with more than one select', () ->
      scope.selectTrade 1
      scope.selectTrade 2

      expect(scope.isTradeSelected(1)).toBe false
      expect(scope.isTradeSelected(2)).toBe true

      expect(scope.selectedTrade).toBe 2

    it 'selecting an already selected item', () ->
      scope.selectTrade 1
      scope.selectTrade 1

      expect(scope.isTradeSelected(1)).toBe false
      expect(scope.selectedTrade).toBe undefined
