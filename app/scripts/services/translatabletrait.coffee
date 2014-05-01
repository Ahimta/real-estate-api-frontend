'use strict'

angular.module('realEstateFrontEndApp')
  .service 'TranslatableTrait', ($locale, $translate) ->
    # AngularJS will instantiate a singleton by calling "new" on this function
    (scope) ->
      $translate.use switch $locale.id[0..1]
        when 'ar' then 'ar'
        else 'en'
