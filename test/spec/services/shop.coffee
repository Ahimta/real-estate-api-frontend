'use strict'

describe 'Service: Shop', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Shop = {}
  beforeEach inject (_Shop_) ->
    Shop = _Shop_

  it 'should do something', () ->
    expect(!!Shop).toBe true
