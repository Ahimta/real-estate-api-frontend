'use strict'

describe 'Controller: WorkersCtrl', ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  window.MyApp.itBehavesLike('controllers/paginatable', 'WorkersCtrl',
    'Worker', 'workers', ['trades', 'shops'])

  window.MyApp.itBehavesLike('controllers/invalidatable', 'WorkersCtrl',
    ['worker'], 'workers', ['trades', 'shops'])

  window.MyApp.itBehavesLike 'controllers/translatable', 'WorkersCtrl'
  window.MyApp.itBehavesLike 'controllers/editable', 'WorkersCtrl'
  window.MyApp.itBehavesLike 'Selectable', 'WorkersCtrl', ['Trade', 'Shop']
  window.MyApp.itBehavesLike 'Crudable', 'WorkersCtrl', 'workers', ['trades', 'shops']
