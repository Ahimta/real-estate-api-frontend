'use strict'

describe 'Service: TranslatableTrait', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  TranslatableTrait = {}
  beforeEach inject (_TranslatableTrait_) ->
    TranslatableTrait = _TranslatableTrait_
