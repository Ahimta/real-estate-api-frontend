'use strict'

describe 'Service: Worker', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Worker = {}
  Myjasmine = undefined

  beforeEach inject (_Worker_, _Myjasmine_) ->
    Worker = _Worker_
    Myjasmine = _Myjasmine_

  it 'shared behavior', () ->
    Myjasmine.itBehavesLike('SimpleCrudable', Worker, 'workers')
