'use strict'

describe 'Service: Worker', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Worker = {}
  beforeEach inject (_Worker_) ->
    Worker = _Worker_
