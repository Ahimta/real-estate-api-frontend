window.MyApp = MyApp ? {}

Selectable = (controller, names) ->
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

      it 'initial state', () ->
        expect(scope[selectedName]).toBe undefined
        expect(scope[isNameSelected](id)).toBe(false) for id in [1..31]

      it 'with one select', () ->
        scope[selectName] 1

        expect(scope[selectedName]).toBe 1
        expect(scope[isNameSelected](1)).toBe true

      it 'with more than one select', () ->
        scope[selectName] 1
        scope[selectName] 2

        expect(scope[isNameSelected](1)).toBe false
        expect(scope[isNameSelected](2)).toBe true

        expect(scope[selectedName]).toBe 2

      it 'selecting an already selected item', () ->
        scope[selectName] 1
        scope[selectName] 1

        expect(scope[isNameSelected](1)).toBe false
        expect(scope[selectedName]).toBe undefined