window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.paginatable = (controller, model,
  mainResource, otherResources=[]) ->

  describe 'Paginatable', ->

    beforeEach inject ($rootScope, $controller, $injector, $httpBackend,
      REALESTATEAPI) ->

      @httpBackend = $httpBackend
      @mainUrl     = "#{REALESTATEAPI}/#{mainResource}"
      @scope       = $rootScope.$new()
      @model       = $injector.get model

      $controller controller,
        $scope: @scope


    describe 'initial state', ->

      it '', -> expect(@scope.isGettingNextPage()).toBe false
      it '', -> expect(@scope.isLastPage()).toBe true
      it '', -> expect(@scope.nextPage()).toBe false

    describe 'x', ->
      beforeEach ->
        count = 21
        pages = Math.ceil(count / 10.0)

        @firstResponse =
          meta:
            parents:
              trades: []
              shops: []
            pagination:
              count: count
              pages: pages
              page: 1

        @secondResponse =
          meta:
            parents:
              trades: []
              shops: []
            pagination:
              count: count
              pages: pages
              page: 2

        @thirdResponse =
          meta:
            parents:
              trades: []
              shops: []
            pagination:
              count: count
              pages: pages
              page: 3

      beforeEach ->
        @firstResponse[mainResource]  = _.shuffle [1..31]
        @secondResponse[mainResource] = _.shuffle [1..31]
        @thirdResponse[mainResource]  = _.shuffle [1..31]

      beforeEach ->
        @httpBackend.expectGET(@mainUrl).respond @firstResponse
        @httpBackend.flush()

      describe 'after the first request', ->
        it '', -> expect(@scope.isGettingNextPage()).toBe false
        it '', -> expect(@scope.isLastPage()).toBe false

        describe 'after the second request', ->
          beforeEach -> @scope.nextPage()

          beforeEach -> expect(@scope.isGettingNextPage()).toBe true
          beforeEach -> expect(@scope.nextPage()).toBe false

          beforeEach ->
            @httpBackend.expectGET("#{@mainUrl}?page=2").respond @secondResponse
            @httpBackend.flush()

          it '', -> expect(@scope.isGettingNextPage()).toBe false
          it '', -> expect(@scope.isLastPage()).toBe false

          it '', ->
            expect(@scope.pagination).toEqual @secondResponse.meta.pagination

          it '', ->
            expect(@scope[mainResource]).toEqual(
              @firstResponse[mainResource].concat(@secondResponse[mainResource]))

          describe 'after the third request', ->
            beforeEach -> @scope.nextPage()

            beforeEach -> expect(@scope.isGettingNextPage()).toBe true
            beforeEach -> expect(@scope.nextPage()).toBe false

            beforeEach ->
              @httpBackend.expectGET("#{@mainUrl}?page=3").respond @thirdResponse
              @httpBackend.flush()

            it '', -> expect(@scope.isGettingNextPage()).toBe false
            it '', -> expect(@scope.isLastPage()).toBe true

            it '', ->
              expect(@scope.pagination).toEqual @thirdResponse.meta.pagination

            it '', ->
              expect(@scope[mainResource]).toEqual @firstResponse[mainResource].
                concat(@secondResponse[mainResource]).
                concat(@thirdResponse[mainResource])
