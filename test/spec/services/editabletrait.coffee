'use strict'

describe 'Service: EditableTrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  EditableTrait = {}
  beforeEach inject (_EditableTrait_) ->
    EditableTrait = _EditableTrait_

  it 'should do something', ->
    expect(!!EditableTrait).toBe true
