'use strict'

angular.module('realEstateFrontEndApp')
  .service 'TranslatableTrait', ($locale, $translate) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->

      scope.isArabic = ->
        $locale.id[0..1] == 'ar'

      $translate.use if scope.isArabic() then 'ar' else 'en'
