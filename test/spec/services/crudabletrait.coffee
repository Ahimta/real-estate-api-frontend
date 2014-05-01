'use strict'

describe 'Service: CrudableTrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  CrudableTrait = {}
  beforeEach inject (_CrudableTrait_) ->
    CrudableTrait = _CrudableTrait_

  it 'should do something', ->
    expect(!!CrudableTrait).toBe true
