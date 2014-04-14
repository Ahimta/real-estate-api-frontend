Crudable = (controller, mainResource, otherResources) ->

  describe 'Crudable', () ->
  
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


    xdescribe 'initial state', () ->
      afterEach () ->
        httpBackend.flush()

        httpBackend.verifyNoOutstandingExpectation()
        httpBackend.verifyNoOutstandingRequest()

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
          expect(scope[mainResource]).toEqual records

          for [collection, resource] in _.zip(othersRecords, otherResources)
            expect(scope[resource]).toEqual collection

          done()


    describe '.create, .update, .destroy', () ->

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

        scope.create2(record).then (response) ->
          expect(response.data).toEqual record

      it '.update', () ->
        record = {id: 7, a: 1, b: 2}
        updatedRecord = {id: 7, a: 2, b: 1}

        httpBackend.whenPUT("#{API}/#{mainResource}/#{record.id}").respond updatedRecord
        httpBackend.expectPUT("#{API}/#{mainResource}/#{record.id}", updatedRecord)

        scope.update2(updatedRecord).then (response) ->
          expect(response.data).toEqual updatedRecord

      it '.destroy', () ->
        record = {id: 3, a: 1, b: 2}

        httpBackend.whenDELETE("#{API}/#{mainResource}/#{record.id}").respond record
        httpBackend.expectDELETE("#{API}/#{mainResource}/#{record.id}")

        scope.destroy2(record.id).then (response) ->
          expect(response.data).toEqual record
