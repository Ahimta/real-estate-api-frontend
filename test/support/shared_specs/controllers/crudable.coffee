window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.crudable = (controller, mainResource, otherResources=[]) ->

  describe 'Crudable', ->

    beforeEach inject (REALESTATEAPI, $httpBackend, $rootScope, $controller) ->
      @httpBackend = $httpBackend
      @API = REALESTATEAPI
      @scope = $rootScope.$new()
      @mainUrl = "#{@API}/#{mainResource}"

      $controller controller,
        $scope: @scope

    beforeEach ->
      count = _.random(21, 100)
      pages = Math.ceil(count / 10.0)
      page  = _.random pages

      @response =
        meta:
          parents:
            trades: _.shuffle [1..7]
            shops: _.shuffle [1..7]
          pagination:
            count: count
            pages: pages
            page: page


    beforeEach ->
      @response[mainResource] = _.shuffle [1..7]

    beforeEach ->
      @httpBackend.expectGET(@mainUrl).respond @response
      @httpBackend.flush()


    afterEach ->
      @response[mainResource] = _.shuffle [1..7]

    afterEach ->
      @httpBackend.expectGET(@mainUrl).respond @response
      @httpBackend.flush()

    afterEach ->
      expect(@scope[resource]).toEqual @response.meta.parents[resource] for resource in otherResources
    afterEach -> expect(@scope[mainResource]).toEqual @response[mainResource]

    afterEach -> expect(@scope.pagination).toEqual @response.meta.pagination

    afterEach -> @httpBackend.verifyNoOutstandingExpectation()
    afterEach -> @httpBackend.verifyNoOutstandingRequest()


    describe 'create', ->
      record = {a: 1, b: 2}

      beforeEach ->
        @httpBackend.expectPOST(@mainUrl, record).respond record

      it '', ->
        @scope.create(record).then (response) ->
          expect(response.data).toEqual record


    describe 'update', ->
      updatedRecord = {id: 7, a: 2, b: 1}
      record        = {id: 7, a: 1, b: 2}

      beforeEach ->
        @httpBackend.expectPUT("#{@mainUrl}/#{record.id}", updatedRecord).
          respond updatedRecord

      it '@response value', ->
        @scope.update(updatedRecord).then (response) ->
          expect(response.data).toEqual updatedRecord

      it '@scope.edit', ->
        @scope.edit record.id

        @scope.update(updatedRecord).then (response) =>
          expect(@scope.isEditing(record.id)).toBe false


    describe 'destroy', ->
      record = {id: 3, a: 1, b: 2}

      beforeEach ->
        @httpBackend.expectDELETE("#{@mainUrl}/#{record.id}").
          respond record

      it '', ->
        @scope.destroy(record.id).then (response) ->
          expect(response.data).toEqual record
