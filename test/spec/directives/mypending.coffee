'use strict'

describe 'Directive: myPending', () ->

  # load the directive's module
  beforeEach module 'realEstateFrontEndApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<my-pending></my-pending>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the myPending directive'
