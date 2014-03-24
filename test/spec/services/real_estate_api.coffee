'use strict'

describe 'Service: REALESTATEAPI', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  REALESTATEAPI = {}
  beforeEach inject (_REALESTATEAPI_) ->
    REALESTATEAPI = _REALESTATEAPI_

  it 'should do something', () ->
    expect(!!REALESTATEAPI).toBe true
