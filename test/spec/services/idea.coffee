'use strict'

describe 'Service: Idea', () ->

  # load the service's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'SimpleCrudable', 'Idea'
