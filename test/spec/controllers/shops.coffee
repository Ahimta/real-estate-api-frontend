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

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
