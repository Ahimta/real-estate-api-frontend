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

    httpBackend.whenGET(url).respond 73
    httpBackend.expectGET url

    Idea.all (data, headers) ->

    httpBackend.flush()

  it '#create', () ->
    url = "#{API}/ideas"
    idea = 31

    httpBackend.whenPOST(url, idea).respond 73
    httpBackend.expectPOST url, idea

    Idea.create idea, (data, headers) ->

    httpBackend.flush()

  it '#update', () ->
    idea = {id: 7,body:'body3',trade_id:'2'}
    url = "#{API}/ideas/#{idea.id}"

    httpBackend.whenPUT(url, idea).respond idea
    httpBackend.expectPUT url, idea

    Idea.update idea, (data, headers) ->

    httpBackend.flush()

  it '#destroy', () ->
    idea = {id: 7,body:'body3',trade_id:'2'}
    url = "#{API}/ideas/#{idea.id}"

    httpBackend.whenDELETE(url).respond idea
    httpBackend.expectDELETE url

    Idea.destroy idea.id, (data, headers) ->

    httpBackend.flush()
