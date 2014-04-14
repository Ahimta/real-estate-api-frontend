'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'Selectable', 'IdeasCtrl', ['Trade']
  window.MyApp.itBehavesLike 'Crudable', 'IdeasCtrl', 'ideas', ['trades']
