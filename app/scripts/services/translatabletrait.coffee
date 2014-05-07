'use strict'

angular.module('realEstateFrontEndApp')
  .service 'TranslatableTrait', ($locale, $translate) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.isArabic = ->
        $locale.id[0..1] == 'ar'

      scope.getDir = ->
        if scope.isArabic() then 'rtl' else 'ltr'

      scope.getLang = ->
        if scope.isArabic() then 'ar' else 'en'

      scope.switchLang = ->
        lang = if scope.isArabic() then 'en' else 'ar'
        $locale.id = lang
        $translate.use lang

      $translate.use if scope.isArabic() then 'ar' else 'en'
