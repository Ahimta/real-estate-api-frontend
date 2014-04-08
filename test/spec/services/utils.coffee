'use strict'

describe 'Service: Utils', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Utils = {}
  beforeEach inject (_Utils_) ->
    Utils = _Utils_
