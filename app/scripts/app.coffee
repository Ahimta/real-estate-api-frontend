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
