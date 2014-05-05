window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.invalidatable = (controller, records,
  mainResource, otherResources=[]) ->

  describe 'Invalidatable', ->

    beforeEach inject ($rootScope, $controller, $httpBackend, REALESTATEAPI) ->
      @mainUrl     = "#{REALESTATEAPI}/#{mainResource}"
      @httpBackend = $httpBackend
      @scope       = $rootScope.$new()

      $controller controller,
        $scope: @scope


    describe 'before initial state', ->
      it '', ->
        expect(@scope[resource]).toBe undefined for resource in otherResources
      it '', -> expect(@scope[record]).toEqual {} for record in records
      it '', -> expect(@scope[mainResource]).toBe undefined


    describe 'initial state', ->
      beforeEach ->
        @response =
          meta:
            parents:
              trades: _.shuffle [1..7]
              shops: _.shuffle [1..7]
            pagination:
              count: 23
              pages: 3
              page: 1

        @response[mainResource] = _.shuffle [1..7]

      beforeEach ->
        @httpBackend.expectGET(@mainUrl).respond @response
        @httpBackend.flush()

      it '', -> expect(@scope[mainResource]).toEqual @response[mainResource]
      it '', -> expect(@scope.pagination).toEqual @response.meta.pagination
      it '', ->
        for resource in otherResources
          expect(@scope[resource]).toEqual @response.meta.parents[resource]
