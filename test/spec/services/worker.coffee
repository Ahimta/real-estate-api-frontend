'use strict'

describe 'Service: Worker', ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'SimpleCrudable', 'Worker'
