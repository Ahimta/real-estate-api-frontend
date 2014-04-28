'use strict'

angular.module('realEstateFrontEndApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',

  'infinite-scroll',
  'pascalprecht.translate',
  'ui.bootstrap'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/ideas',
        templateUrl: 'views/ideas.html'
        controller: 'IdeasCtrl'
      .when '/trades',
        templateUrl: 'views/trades.html'
        controller: 'TradesCtrl'
      .when '/shops',
        templateUrl: 'views/shops.html'
        controller: 'ShopsCtrl'
      .when '/workers',
        templateUrl: 'views/workers.html'
        controller: 'WorkersCtrl'
      .otherwise
        redirectTo: '/trades'

  .config ($translateProvider) ->
    $translateProvider
      .translations 'en',
        TRADES:
          PLURAL: 'Trades'
          SINGLE: 'Trade'
          NEW: 'New trade'
        SHOPS:
          PLURAL: 'Shops'
          SINGLE: 'Shop'
          NEW: 'New shop'
        IDEAS:
          PLURAL: 'Ideas'
          SINGLE: 'Idea'
          NEW: 'New idea'
        WORKERS:
          PLURAL: 'Contractors'
          SINGLE: 'Contractor'
          NEW: 'New contractor'

        DELETE: 'Delete'
        RESET: 'Reset'
        SAVE: 'Save'
        EDIT: 'Edit'

        NAME: 'Name'
        PHONE: 'Phone'
        RATING: 'Rating'
        NOTES: 'Notes'
        CONTENT: 'Content'

      .translations 'ar',
        TRADES:
          PLURAL: 'فئات'
          SINGLE: 'فئة'
          NEW: 'إضافة فئة'
        SHOPS:
          PLURAL: 'محلات'
          SINGLE: 'محل'
          NEW: 'إضافة محل'
        IDEAS:
          PLURAL: 'أفكار'
          SINGLE: 'فكرة'
          NEW: 'إضافة فكرة'
        WORKERS:
          PLURAL: 'عمال'
          SINGLE: 'عامل'
          NEW: 'إضافة عامل'

        DELETE: 'حذف'
        RESET: 'إلغاء'
        SAVE: 'حفظ'
        EDIT: 'تعديل'

        NAME: 'الاسم'
        PHONE: 'الهاتف'
        RATING: 'التقييم'
        NOTES: 'ملاحظات'
        CONTENT: 'المحتوى'
