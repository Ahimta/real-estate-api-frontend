window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.crudable = (controller, mainResource, otherResources=[]) ->

  describe 'Crudable', ->

    httpBackend = undefined
    mainUrl     = undefined
    scope       = undefined
    API         = undefined
    routeParams = undefined

    beforeEach inject (REALESTATEAPI, $httpBackend, $rootScope, $controller) ->
      httpBackend = $httpBackend
      API = REALESTATEAPI
      scope = $rootScope.$new()
      routeParams = {page: _.random(100)}
      $controller controller, {
        $scope: scope,
        $routeParams: routeParams
      }

    beforeEach ->
      mainUrl = "#{API}/#{mainResource}"


    describe 'initial state', ->

      describe 'pagination', ->
        it '', -> expect(scope.page).toBe routeParams.page

      describe 'http requests', ->
        mainCollection = undefined
        response       = undefined

        beforeEach ->
          count = _.random(21, 100)
          pages = Math.ceil(count / 10.0)
          page  = _.random(1, pages)

          response =
            meta:
              parents:
                trades: []
                shops: []
              pagination:
                count: count
                pages: pages
                page: page

        beforeEach ->
          mainCollection = _.shuffle [1..7]
          response[mainResource] = mainCollection

        beforeEach ->
          httpBackend.expectGET("#{mainUrl}?page=#{scope.page}").respond response

        afterEach ->
          httpBackend.verifyNoOutstandingExpectation()
          httpBackend.verifyNoOutstandingRequest()


        describe 'before the data is fetched', ->
          afterEach ->
            httpBackend.flush()

          it '', -> expect(scope[resource]).toBe undefined for resource in otherResources
          it '', -> expect(scope[mainResource]).toBe undefined
          it '', -> expect(scope.pagination).toBe undefined


        describe 'after the data is fetched', ->
          beforeEach ->
            httpBackend.flush()

          it '', -> expect(scope[resource]).toEqual [] for resource in otherResources
          it '', -> expect(scope[mainResource]).toEqual mainCollection

          it '', -> expect(scope.pagination).toEqual response.meta.pagination
          it '', -> expect(scope.page).toEqual response.meta.pagination.page


    describe '.create, .update, .destroy', () ->

      mainCollection = undefined
      response = undefined

      beforeEach ->
        count = _.random(21, 100)
        pages = Math.ceil(count / 10.0)
        page  = _.random(1, pages)

        response =
          meta:
            parents:
              trades: []
              shops: []
            pagination:
              count: count
              pages: pages
              page: page


      beforeEach ->
        mainCollection = _.shuffle [1..7]
        response[mainResource] = mainCollection

      beforeEach -> httpBackend.expectGET("#{mainUrl}?page=#{scope.page}").respond response

      beforeEach -> expect(scope[mainResource]).toBe undefined
      beforeEach -> expect(scope[resource]).toBe undefined for resource in otherResources

      beforeEach -> expect(scope.pagination).toBe undefined
      beforeEach -> expect(scope.page).toEqual routeParams.page

      beforeEach -> httpBackend.flush()

      beforeEach -> expect(scope[resource]).toEqual [] for resource in otherResources
      beforeEach -> expect(scope[mainResource]).toEqual mainCollection


      afterEach ->
        mainCollection = _.shuffle mainCollection
        response[mainResource] = mainCollection

      afterEach ->
        httpBackend.expectGET("#{mainUrl}?page=#{scope.page}").respond response
        httpBackend.flush()

      afterEach -> expect(scope[resource]).toEqual [] for resource in otherResources
      afterEach -> expect(scope[mainResource]).toEqual mainCollection

      afterEach -> expect(scope.pagination).toEqual response.meta.pagination
      afterEach -> expect(scope.page).toEqual response.meta.pagination.page

      afterEach -> httpBackend.verifyNoOutstandingExpectation()
      afterEach -> httpBackend.verifyNoOutstandingRequest()


      describe 'create', ->
        record = {a: 1, b: 2}

        beforeEach ->
          httpBackend.expectPOST(mainUrl, record).respond record

        it '', ->
          scope.create(record).then (response) ->
            expect(response.data).toEqual record


      describe 'update', ->
        updatedRecord = {id: 7, a: 2, b: 1}
        record        = {id: 7, a: 1, b: 2}

        beforeEach ->
          httpBackend.expectPUT("#{mainUrl}/#{record.id}", updatedRecord).
            respond updatedRecord

        it 'response value', ->
          scope.update(updatedRecord).then (response) ->
            expect(response.data).toEqual updatedRecord

        it 'scope.edit', ->
          scope.edit record.id

          scope.update(updatedRecord).then (response) ->
            expect(scope.isEditing(record.id)).toBe false


      describe 'destroy', ->
        record = {id: 3, a: 1, b: 2}

        beforeEach ->
          httpBackend.expectDELETE("#{mainUrl}/#{record.id}").
            respond record

        it '', ->
          scope.destroy(record.id).then (response) ->
            expect(response.data).toEqual record
