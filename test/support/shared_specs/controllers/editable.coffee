window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.editable = (controller) ->

  describe 'Editable', ->

    beforeEach inject ($rootScope, $controller) ->
      @scope = $rootScope.$new()

      $controller controller, {
        $scope: @scope
      }

    describe 'initial state', ->

      describe 'editing', ->
        it 'should not be editing anything', ->
          expect(@scope.isEditing(_.random i)).toBe false for i in [1..31]

      describe 'resetting', ->
        beforeEach -> @scope.reset _.random i for i in [1..31]

        it 'should not be editing anything', ->
          expect(@scope.isEditing(_.random i)).toBe false for i in [1..31]


    describe 'editing items', ->

      describe 'editing one item', ->
        item = _.random 99999

        beforeEach -> @scope.edit item

        it 'should mark the item as editing', ->
          expect(@scope.isEditing(item)).toBe true

        it 'should mark everything else as not editing', ->
          for i in [1..31] when i != item
            expect(@scope.isEditing(_.random i)).toBe false

      describe 'editing more than one element', ->
        item1 = _.random 99999
        item2 = _.random 99999

        beforeEach ->
          @scope.edit item1
          @scope.edit item2

        it 'should mark the first item as editing', ->
          expect(@scope.isEditing(item1)).toBe true

        it 'should mark the second item as editing', ->
          expect(@scope.isEditing(item2)).toBe true

        it 'should mark everything else as not editing', ->
          for i in [1..31] when i != item1 and i != item2
            expect(@scope.isEditing(_.random i)).toBe false


    describe 'resetting items', ->

      describe 'resetting with one item editing', ->
        item = _.random 99999

        beforeEach ->
          @scope.edit item

        describe 'resetting the item one time', ->
          beforeEach ->
            @scope.reset item

          it 'should mark the item as not editing', ->
            expect(@scope.isEditing(item)).toBe false

        describe 'resetting the item more than one time', ->
          beforeEach ->
            @scope.reset item
            @scope.reset item

          it 'should mark the item as not editing', ->
            expect(@scope.isEditing(item)).toBe false

      describe 'resetting with more than one item editing', ->
        item1 = _.random 99999
        item2 = _.random 99999

        beforeEach ->
          @scope.edit item1
          @scope.edit item2

        describe 'resetting the first item', ->
          beforeEach ->
            @scope.reset item1

          it 'should mark the first item as not editing', ->
            expect(@scope.isEditing(item1)).toBe false

          it 'should not mark the second item as editing', ->
            expect(@scope.isEditing(item2)).toBe true

        describe 'resetting both items more than one time', ->
          beforeEach ->
            @scope.reset item1
            @scope.reset item2
            @scope.reset item2
            @scope.reset item1

          it 'should mark the first item as not editing', ->
            expect(@scope.isEditing(item1)).toBe false

          it 'should mark the second item as not editing', ->
            expect(@scope.isEditing(item2)).toBe false
