'use strict'

describe 'Controller: NavbarCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  NavbarCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    NavbarCtrl = $controller 'NavbarCtrl', {
      $scope: scope
    }
