'use strict'

describe 'Controller: MaincontrollerCtrl', ->

  # load the controller's module
  beforeEach module 'realEstateFrontEndApp'

  MaincontrollerCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MaincontrollerCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  window.MyApp.itBehavesLike 'controllers/translatable', 'MainCtrl'
