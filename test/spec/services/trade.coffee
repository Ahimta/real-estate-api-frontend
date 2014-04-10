'use strict'

describe 'Service: Trade', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Trade = {}
  Myjasmine = undefined

  beforeEach inject (_Trade_, _Myjasmine_) ->
    Trade = _Trade_
    Myjasmine = _Myjasmine_

  it 'shared behavior', () ->
    Myjasmine.itBehavesLike('SimpleCrudable', Trade, 'trades')
