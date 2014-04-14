'use strict'

describe 'Controller: ShopsCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'Selectable', 'ShopsCtrl', ['Trade']
  window.MyApp.itBehavesLike 'Crudable', 'ShopsCtrl', 'shops', ['trades']
