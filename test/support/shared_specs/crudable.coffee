Crudable = (controller, mainResource, otherResources) ->

  describe '.create, .update, .destroy', () ->
  
    mainUrl = undefined
    otherUrls = undefined
    httpBackend = undefined
    API = undefined
    scope = undefined

    beforeEach inject (REALESTATEAPI, $httpBackend, $rootScope, $controller) ->
      httpBackend = $httpBackend
      API = REALESTATEAPI
      scope = $rootScope.$new()
      $controller controller, {
        $scope: scope
      }

    beforeEach () ->
      mainUrl = "#{API}/#{mainResource}"
      otherUrls = _.map otherResources, (resource) ->
        "#{API}/#{resource}"

    beforeEach () ->
      httpBackend.whenGET(url).respond [{}] for url in otherUrls
      httpBackend.whenGET(mainUrl).respond [{}]

      httpBackend.expectGET url for url in otherUrls
      httpBackend.expectGET mainUrl

    afterEach () ->
      httpBackend.expectGET url for url in otherUrls
      httpBackend.expectGET mainUrl

      httpBackend.flush()
      httpBackend.verifyNoOutstandingExpectation()
      httpBackend.verifyNoOutstandingRequest()


    it '.create', () ->
      record = {a: 1, b: 2}

      httpBackend.whenPOST(mainUrl).respond record
      httpBackend.expectPOST(mainUrl, record)

      scope.create record

    it '.update', () ->
      record = {id: 7, a: 1, b: 2}
      updatedRecord = {id: 7, a: 2, b: 1}

      httpBackend.whenPUT("#{API}/#{mainResource}/#{record.id}").respond updatedRecord
      httpBackend.expectPUT("#{API}/#{mainResource}/#{record.id}", updatedRecord)

      scope.update updatedRecord

    it '.destroy', () ->
      record = {id: 3, a: 1, b: 2}

      httpBackend.whenDELETE("#{API}/#{mainResource}/#{record.id}").respond record
      httpBackend.expectDELETE("#{API}/#{mainResource}/#{record.id}")

      scope.destroy record.id
