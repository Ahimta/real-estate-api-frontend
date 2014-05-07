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

    arabicBehavior = ->
      it '', -> expect(translate.use).toHaveBeenCalledWith 'ar'
      it '', -> expect(scope.getLang()).toEqual 'ar'
      it '', -> expect(scope.isArabic()).toBe true
      it '', -> expect(scope.getDir()).toEqual 'rtl'

    englishBehavior = ->
      it '', -> expect(translate.use).toHaveBeenCalledWith 'en'
      it '', -> expect(scope.getLang()).toEqual 'en'
      it '', -> expect(scope.isArabic()).toBe false
      it '', -> expect(scope.getDir()).toEqual 'ltr'



    describe 'when the locale is ar-*', ->
      beforeEach myBeforeHook('ar-SA')

      describe 'initial state', ->
        arabicBehavior()

      describe 'switching the language', ->
        beforeEach -> scope.switchLang()
        englishBehavior()


    describe 'en', ->
      describe 'when the locale is en-*', ->
        beforeEach myBeforeHook('en-SA')
        englishBehavior()

        describe 'switching the language', ->
          beforeEach -> scope.switchLang()
          arabicBehavior()

      describe 'when the locale is not ar-* or en-*', ->
        beforeEach myBeforeHook('de-GE')
        englishBehavior()

        describe 'switching the language', ->
          beforeEach -> scope.switchLang()
          arabicBehavior()

      describe 'when the locale is 1 character long', ->
        beforeEach myBeforeHook('e')
        englishBehavior()

        describe 'switching the language', ->
          beforeEach -> scope.switchLang()
          arabicBehavior()

      describe 'when the locale is an empty string', ->
        beforeEach myBeforeHook('')
        englishBehavior()

        describe 'switching the language', ->
          beforeEach -> scope.switchLang()
          arabicBehavior()
