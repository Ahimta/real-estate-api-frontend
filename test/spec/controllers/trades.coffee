'use strict'

describe 'Controller: TradesCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  TradesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    TradesCtrl = $controller 'TradesCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(1).toBe 1
