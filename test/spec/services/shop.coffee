'use strict'

describe 'Service: Shop', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'SimpleCrudable', 'Shop'
