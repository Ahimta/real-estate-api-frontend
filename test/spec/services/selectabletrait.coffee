'use strict'

describe 'Service: Selectabletrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  SelectableTrait = {}
  beforeEach inject (_SelectableTrait_) ->
    SelectableTrait = _SelectableTrait_

  it 'should do something', ->
    expect(!!SelectableTrait).toBe true
