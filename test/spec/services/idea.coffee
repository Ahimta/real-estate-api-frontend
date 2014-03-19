'use strict'

describe 'Service: Idea', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Idea = {}
  beforeEach inject (_Idea_) ->
    Idea = _Idea_

  it 'should do something', () ->
    expect(!!Idea).toBe true
