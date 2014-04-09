'use strict'

describe 'Service: Myjasmine', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Myjasmine = {}
  beforeEach inject (_Myjasmine_) ->
    Myjasmine = _Myjasmine_

  it 'should do something', ->
    expect(!!Myjasmine).toBe true
