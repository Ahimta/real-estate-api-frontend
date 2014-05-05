window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.invalidatable = (controller, records,
  mainResource, otherResources=[]) ->

  describe 'Invalidatable', ->

    beforeEach inject ($rootScope, $controller, $httpBackend) ->
      @httpBackend = $httpBackend
      @scope = $rootScope.$new()

      $controller controller,
        $scope: @scope


    describe 'initial state', ->
      it '', -> expect(@scope[record]).toEqual {} for record in records
