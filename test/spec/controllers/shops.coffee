'use strict'

describe 'Controller: ShopsCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'controllers/editable', 'ShopsCtrl'
  window.MyApp.itBehavesLike 'Selectable', 'ShopsCtrl', ['Trade']
  window.MyApp.itBehavesLike 'Crudable', 'ShopsCtrl', 'shops', ['trades']
