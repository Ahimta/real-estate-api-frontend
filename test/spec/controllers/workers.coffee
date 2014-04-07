'use strict'

describe 'Controller: WorkersCtrl', ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  WorkersCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    WorkersCtrl = $controller 'WorkersCtrl', {
      $scope: scope
    }
