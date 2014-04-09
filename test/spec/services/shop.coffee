'use strict'

describe 'Service: Shop', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  # instantiate service
  Shop = {}
  Myjasmine = undefined

  beforeEach inject (_Shop_, _Myjasmine_) ->
    Shop = _Shop_
    Myjasmine = _Myjasmine_

  it 'a', () ->
    Myjasmine.itBehavesLike(Shop, 'shops')
