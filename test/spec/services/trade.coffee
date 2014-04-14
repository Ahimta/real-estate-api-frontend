'use strict'

describe 'Service: Trade', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'SimpleCrudable', 'Trade'
