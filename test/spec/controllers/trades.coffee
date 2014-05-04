'use strict'

describe 'Controller: TradesCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike('controllers/paginatable', 'TradesCtrl',
    'Trade', 'trades')

  window.MyApp.itBehavesLike 'controllers/translatable', 'TradesCtrl'
  window.MyApp.itBehavesLike 'controllers/editable', 'TradesCtrl'
  window.MyApp.itBehavesLike 'Crudable', 'TradesCtrl', 'trades'
