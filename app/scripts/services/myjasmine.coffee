'use strict'

angular.module('realEstateFrontEndApp')
  .service 'Myjasmine', ->
    # AngularJS will instantiate a singleton by calling "new" on this function

    simpleCrudable = (Model, name) ->
      API = undefined
      httpBackend = undefined

      inject (_REALESTATEAPI_, $httpBackend) ->
        API = _REALESTATEAPI_
        httpBackend = $httpBackend

      myAfter = () ->
        httpBackend.verifyNoOutstandingExpectation()
        httpBackend.verifyNoOutstandingRequest()

      #all
      url = "#{API}/#{name}"
      records = ({id:i,body:"body#{i}",trade_id:i+1} for i in [1..7])

      httpBackend.whenGET(url).respond records
      httpBackend.expectGET url

      Model.all (data, headers) ->
        expect(angular.equals(data, records)).toBe true

      httpBackend.flush()
      myAfter()


      #create
      url = "#{API}/#{name}"
      record = {body:'body',trade_id:31}

      httpBackend.whenPOST(url, record).respond record
      httpBackend.expectPOST url, record

      Model.create record, (data, headers) ->
        expect(data.body).toEqual record.body

      httpBackend.flush()
      myAfter()


      #update
      record = {id: 7}
      url = "#{API}/#{name}/#{record.id}"

      httpBackend.whenPUT(url, record).respond record
      httpBackend.expectPUT url, record
   
      Model.update record, (data, headers) ->
        expect(data.id).toEqual record.id

      httpBackend.flush()
      myAfter()

      
      #destroy
      record = {id: 7,body:'body3',trade_id:'2'}
      url = "#{API}/#{name}/#{record.id}"

      httpBackend.whenDELETE(url).respond record
      httpBackend.expectDELETE url

      Model.destroy record.id, (data, headers) ->
        expect(data.id).toEqual record.id

      httpBackend.flush()
      myAfter()

    itBehavesLike: (example, args...) ->
      switch example
        when 'SimpleCrudable' then simpleCrudable(args...)