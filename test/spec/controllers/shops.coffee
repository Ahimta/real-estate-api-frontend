'use strict'

describe 'Controller: ShopsCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  ShopsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ShopsCtrl = $controller 'ShopsCtrl', {
      $scope: scope
    }
