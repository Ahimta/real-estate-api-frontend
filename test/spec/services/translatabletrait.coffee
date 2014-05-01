'use strict'

describe 'Service: TranslatableTrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  TranslatableTrait = {}
  beforeEach inject (_TranslatableTrait_) ->
    TranslatableTrait = _TranslatableTrait_

  it 'should do something', ->
    expect(!!TranslatableTrait).toBe true
