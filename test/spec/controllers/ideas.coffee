'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  IdeasCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IdeasCtrl = $controller 'IdeasCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
