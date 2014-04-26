'use strict'

angular.module('realEstateFrontEndApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute',

  'infinite-scroll',
  'pascalprecht.translate'
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

      .use 'en'
