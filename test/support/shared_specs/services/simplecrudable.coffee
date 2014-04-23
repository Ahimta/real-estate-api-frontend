window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.services ?= {}

window.MyApp.sharedSpecs.services.simpleCrudable = (model) ->

  describe 'SimpleCrudable', () ->

    name = "#{model.toLowerCase()}s"
    resource = undefined
    httpBackend = undefined
    Model = undefined

    beforeEach inject (REALESTATEAPI, $httpBackend, $injector) ->
      resource = "#{REALESTATEAPI}/#{name}"
      httpBackend = $httpBackend
      Model = $injector.get model

    afterEach () ->
      httpBackend.flush()
      httpBackend.verifyNoOutstandingExpectation()
      httpBackend.verifyNoOutstandingRequest()


    describe '.all', () ->
      records = ({id:i,body:"body#{i}",trade_id:i+1} for i in [1..7])

      beforeEach -> httpBackend.expectGET(resource).respond records

      it '', ->
        Model.all().then (response) ->
          expect(response.data).toEqual records


    describe '.create', () ->
      record = {body:'body',trade_id:31}

      beforeEach -> httpBackend.expectPOST(resource, record).respond record

      it '', ->
        Model.create(record).then (response) ->
          expect(response.data).toEqual record


    describe '.update', () ->
      record = undefined
      url    = undefined

      beforeEach ->
        record = {id: 7}
        url = "#{resource}/#{record.id}"

      beforeEach -> httpBackend.expectPUT(url).respond record

      it '', ->
        Model.update(record).then (response) ->
          expect(response.data).toEqual record


    describe '.destroy', () ->
      record = undefined
      url    = undefined

      beforeEach ->
        record = {id: 7,body:'body3',trade_id:'2'}
        url = "#{resource}/#{record.id}"

      beforeEach -> httpBackend.expectDELETE(url).respond record

      it '', ->
        Model.destroy(record.id).then (response) ->
          expect(response.data).toEqual record
