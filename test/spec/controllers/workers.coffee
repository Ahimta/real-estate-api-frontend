'use strict'

describe 'Controller: WorkersCtrl', ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike 'controllers/editable', 'WorkersCtrl'
  window.MyApp.itBehavesLike 'Selectable', 'WorkersCtrl', ['Trade', 'Shop']
  window.MyApp.itBehavesLike 'Crudable', 'WorkersCtrl', 'workers', ['trades', 'shops']
