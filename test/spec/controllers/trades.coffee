'use strict'

describe 'Controller: TradesCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'Crudable', 'TradesCtrl', 'trades'
