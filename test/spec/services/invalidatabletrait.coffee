'use strict'

describe 'Service: InvalidatableTrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  InvalidatableTrait = {}
  beforeEach inject (_InvalidatableTrait_) ->
    InvalidatableTrait = _InvalidatableTrait_

  it 'should do something', ->
    expect(!!InvalidatableTrait).toBe true
