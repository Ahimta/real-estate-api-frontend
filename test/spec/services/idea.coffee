'use strict'

describe 'Service: Idea', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Idea = {}
  Myjasmine = undefined

  beforeEach inject (_Idea_, _Myjasmine_) ->
    Idea = _Idea_
    Myjasmine = _Myjasmine_


  it 'a', () ->
    Myjasmine.itBehavesLike(Idea, 'ideas')
