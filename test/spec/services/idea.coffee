'use strict'

describe 'Service: idea', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  idea = {}
  beforeEach inject (_idea_) ->
    idea = _idea_

  it 'should do something', () ->
    expect(!!idea).toBe true
