'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  IdeasCtrl = {}
  timeout = undefined
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, $httpBackend, REALESTATEAPI,
    $timeout) ->
    timeout = $timeout
    scope = $rootScope.$new()
    IdeasCtrl = $controller 'IdeasCtrl', {
      $scope: scope
    }


  describe 'Crudable', () ->

    httpBackend = undefined
    API = undefined

    beforeEach inject ($httpBackend, REALESTATEAPI) ->
      httpBackend = $httpBackend
      API = REALESTATEAPI

    describe 'Editable', () ->
      it 'initial state', () ->
        expect(scope.isEditing(id)).toBe false for id in [1..31]

      it '.edit, .isEditing', () ->
        for id in [1..7]
          expect(scope.isEditing(id)).toBe false
          scope.edit id

          expect(scope.isEditing(i)).toBe true for i in [1..id]

          if id != 7
            for i in [(id+1)..7]
              expect(scope.isEditing(i)).toBe false

      it '.reset', () ->
        for id in [1..7]
          scope.edit id
          scope.reset id

          expect(scope.isEditing(id)).toBe false


    describe '.create, .update, .destroy', () ->

      beforeEach () ->
        httpBackend.whenGET("#{API}/trades").respond [{}]
        httpBackend.whenGET("#{API}/ideas").respond [{}]

        httpBackend.expectGET "#{API}/trades"
        httpBackend.expectGET "#{API}/ideas"

      afterEach () ->
        httpBackend.expectGET "#{API}/trades"
        httpBackend.expectGET "#{API}/ideas"

        httpBackend.flush()
        httpBackend.verifyNoOutstandingExpectation()
        httpBackend.verifyNoOutstandingRequest()


      it '.create', () ->
        record = {a: 1, b: 2}

        httpBackend.whenPOST("#{API}/ideas").respond record
        httpBackend.expectPOST("#{API}/ideas", record)

        scope.create record

      it '.update', () ->
        record = {id: 7, a: 1, b: 2}
        updatedRecord = {id: 7, a: 2, b: 1}

        httpBackend.whenPUT("#{API}/ideas/#{record.id}").respond updatedRecord
        httpBackend.expectPUT("#{API}/ideas/#{record.id}", updatedRecord)

        scope.update updatedRecord

      it '.destroy', () ->
        record = {id: 3, a: 1, b: 2}

        httpBackend.whenDELETE("#{API}/ideas/#{record.id}").respond record
        httpBackend.expectDELETE("#{API}/ideas/#{record.id}")

        scope.destroy record.id

        
    it 'initial state', (done) ->
      trades = [{a:1,b:2}]
      ideas  = [{x:1,b:2}]

      httpBackend.whenGET("#{API}/trades").respond trades
      httpBackend.whenGET("#{API}/ideas").respond ideas

      expect(scope.trades).toBe undefined
      expect(scope.ideas).toBe undefined

      window.setTimeout () ->
        expect(angular.equals(scope.ideas, ideas)).toBe true
        expect(angular.equals(scope.trades, trades)).toBe true

        done()

      httpBackend.flush()


  describe 'Selectable', () ->
    names = ['Trade']

    for name in names
      isNameSelected = "is#{name}Selected"
      selectedName = "selected#{name}"
      selectName = "select#{name}"

      it 'initial state', () ->
        expect(scope[selectedName]).toBe undefined
        expect(scope[isNameSelected](id)).toBe(false) for id in [1..31]

      it 'with one select', () ->
        scope[selectName] 1

        expect(scope[selectedName]).toBe 1
        expect(scope[isNameSelected](1)).toBe true

      it 'with more than one select', () ->
        scope[selectName] 1
        scope[selectName] 2

        expect(scope[isNameSelected](1)).toBe false
        expect(scope[isNameSelected](2)).toBe true

        expect(scope[selectedName]).toBe 2

      it 'selecting an already selected item', () ->
        scope[selectName] 1
        scope[selectName] 1

        expect(scope[isNameSelected](1)).toBe false
        expect(scope[selectedName]).toBe undefined
