'use strict'

angular.module('realEstateFrontEndApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
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
      .otherwise
        redirectTo: '/trades'
