window.MyApp ?= {}
window.MyApp.sharedSpecs ?= {}
window.MyApp.sharedSpecs.controllers ?= {}

window.MyApp.sharedSpecs.controllers.translatable = (controller) ->

  describe 'Translatable', ->

    translate = null
    scope     = null

    myBeforeHook = (locale_id) ->
      inject ($rootScope, $controller, $locale, $translate) ->
        $locale.id = locale_id
        translate  = $translate
        scope      = $rootScope.$new()

        spyOn translate, 'use'

        $controller controller,
          $translate: translate
          $scope: scope

    describe 'when the locale is en-*', ->
      beforeEach myBeforeHook('en-SA')

      it '', -> expect(translate.use).toHaveBeenCalledWith 'en'
      it '', -> expect(scope.isArabic()).toBe false


    describe 'when the locale is ar-*', ->
      beforeEach myBeforeHook('ar-SA')

      it '', -> expect(translate.use).toHaveBeenCalledWith 'ar'
      it '', -> expect(scope.isArabic()).toBe true


    describe 'when the locale is not ar-* or en-*', ->
      beforeEach myBeforeHook('de-GE')

      it '', -> expect(translate.use).toHaveBeenCalledWith 'en'
      it '', -> expect(scope.isArabic()).toBe false


    describe 'when the locale is 1 character long', ->
      beforeEach myBeforeHook('e')

      it '', -> expect(translate.use).toHaveBeenCalledWith 'en'
      it '', -> expect(scope.isArabic()).toBe false


    describe 'when the locale is an empty string', ->
      beforeEach myBeforeHook('')

      it '', -> expect(translate.use).toHaveBeenCalledWith 'en'
      it '', -> expect(scope.isArabic()).toBe false
