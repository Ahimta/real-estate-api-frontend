'use strict'

describe 'Service: Idea', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Idea = {}
  API = undefined
  httpBackend = undefined

  beforeEach inject (_Idea_, $httpBackend, REALESTATEAPI) ->
    Idea = _Idea_
    API = REALESTATEAPI
    httpBackend = $httpBackend

  afterEach () ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()


  it '#all', () ->
    url = "#{API}/ideas"
    ideas = ({id:i,body:"body#{i}",trade_id:i+1} for i in [1..7])

    httpBackend.whenGET(url).respond ideas
    httpBackend.expectGET url

    Idea.all (data, headers) ->
      expect(angular.equals(data, ideas)).toBe true

    httpBackend.flush()


  it '#create', () ->
    url = "#{API}/ideas"
    idea = {body:'body',trade_id:31}

    httpBackend.whenPOST(url, idea).respond idea
    httpBackend.expectPOST url, idea

    Idea.create idea, (data, headers) ->
      expect(data.body).toEqual idea.body

    httpBackend.flush()

  it '#update', () ->
    idea = {id: 7}
    url = "#{API}/ideas/#{idea.id}"

    httpBackend.whenPUT(url, idea).respond idea
    httpBackend.expectPUT url, idea
 
    Idea.update idea, (data, headers) ->
      expect(data.id).toEqual idea.id

    httpBackend.flush()

  it '#destroy', () ->
    idea = {id: 7,body:'body3',trade_id:'2'}
    url = "#{API}/ideas/#{idea.id}"

    httpBackend.whenDELETE(url).respond idea
    httpBackend.expectDELETE url

    Idea.destroy idea.id, (data, headers) ->
      expect(data.id).toEqual idea.id

    httpBackend.flush()
