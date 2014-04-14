simpleCrudable = (model) ->

  describe 'SimpleCrudable', () ->

    name = "#{model.toLowerCase()}s"
    resource = undefined
    API = undefined
    httpBackend = undefined
    Model = undefined

    beforeEach inject (_REALESTATEAPI_, $httpBackend, $injector) ->
      API = _REALESTATEAPI_
      httpBackend = $httpBackend
      Model = $injector.get model

    beforeEach () ->
      resource = "#{API}/#{name}"

    afterEach () ->
      httpBackend.flush()
      httpBackend.verifyNoOutstandingExpectation()
      httpBackend.verifyNoOutstandingRequest()


    it '.all', () ->
      records = ({id:i,body:"body#{i}",trade_id:i+1} for i in [1..7])

      httpBackend.whenGET(resource).respond records
      httpBackend.expectGET resource

      Model.all().then (response) ->
        expect(response.data).toEqual records


    it '.create', () ->
      record = {body:'body',trade_id:31}

      httpBackend.whenPOST(resource, record).respond record
      httpBackend.expectPOST resource, record

      Model.create(record).then (response) ->
        expect(response.data).toEqual record


    it '.update', () ->
      record = {id: 7}
      url = "#{resource}/#{record.id}"

      httpBackend.whenPUT(url, record).respond record
      httpBackend.expectPUT url, record
   
      Model.update(record).then (response) ->
        expect(response.data).toEqual record

      
    it '.destroy', () ->
      record = {id: 7,body:'body3',trade_id:'2'}
      url = "#{resource}/#{record.id}"

      httpBackend.whenDELETE(url).respond record
      httpBackend.expectDELETE url

      Model.destroy(record.id).then (response) ->
        expect(response.data).toEqual record
