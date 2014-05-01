'use strict'

describe 'Service: PaginatableTrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  PaginatableTrait = {}
  beforeEach inject (_PaginatableTrait_) ->
    PaginatableTrait = _PaginatableTrait_

  it 'should do something', ->
    expect(!!PaginatableTrait).toBe true
