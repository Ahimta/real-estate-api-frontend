'use strict'

describe 'Service: Trade', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Trade = {}
  beforeEach inject (_Trade_) ->
    Trade = _Trade_

  it 'should do something', () ->
    expect(!!Trade).toBe true
