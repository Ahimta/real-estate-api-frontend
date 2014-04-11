'use strict'

describe 'Service: ControllersTraits', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  ControllersTraits = {}
  beforeEach inject (_ControllersTraits_) ->
    ControllersTraits = _ControllersTraits_

  it 'should do something', ->
    expect(!!ControllersTraits).toBe true
