'use strict'

describe 'Controller: IdeasCtrl', () ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  Idea = {
    create: (idea, afterCreate) -> 1,
    destroy: (id) -> 9090
  }
  Trade = {
    all: () -> 99
  }

  IdeasCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    IdeasCtrl = $controller 'IdeasCtrl', {
      $scope: scope,
      Trade: Trade,
      Idea: Idea
    }

  it 'should attach a list of trades', () ->
    expect(scope.trades).toBe 99

  it 'scope.create', () ->
    spyOn(Idea, 'create')
    scope.create()
    expect(Idea.create).toHaveBeenCalled()

  it 'scope.destroy', () ->
    spyOn(Idea, 'destroy')
    scope.destroy 7
    expect(Idea.destroy).toHaveBeenCalled()
