window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.selectable = (controller, names) ->
  describe 'Selectable', () ->
    scope = undefined

    beforeEach inject ($controller, $rootScope) ->
      scope = $rootScope.$new()
      $controller controller, {
        $scope: scope
      }

    for name in names
      isNameSelected = "is#{name}Selected"
      selectedName = "selected#{name}"
      selectName = "select#{name}"

      describe 'initial state', ->
        it '', -> expect(scope[isNameSelected](id)).toBe(false) for id in [1..31]
        it '', -> expect(scope[selectedName]).toBe undefined


      describe 'with one select', ->
        id = 1

        beforeEach -> scope[selectName](id)

        it '', -> expect(scope[isNameSelected](id)).toBe true
        it '', -> expect(scope[selectedName]).toBe id


      describe 'with more than one select', ->
        id1 = 1
        id2 = 2

        beforeEach ->
          scope[selectName](id1)
          scope[selectName](id2)

        it '', -> expect(scope[isNameSelected](id1)).toBe false
        it '', -> expect(scope[isNameSelected](id2)).toBe true
        it '', -> expect(scope[selectedName]).toBe id2


      describe 'selecting an already selected item', ->
        id = 1

        beforeEach ->
          scope[selectName](id)
          scope[selectName](id)

        it '', -> expect(scope[isNameSelected](id)).toBe false
        it '', -> expect(scope[selectedName]).toBe undefined
