'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'controllers/editable', 'IdeasCtrl'
  window.MyApp.itBehavesLike 'Selectable', 'IdeasCtrl', ['Trade']
  window.MyApp.itBehavesLike 'Crudable', 'IdeasCtrl', 'ideas', ['trades']
