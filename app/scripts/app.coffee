'use strict'

angular.module('realEstateFrontEndApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/ideas',
        templateUrl: 'views/ideas.html'
        controller: 'IdeasCtrl'
      .when '/trades',
        templateUrl: 'views/trades.html'
        controller: 'TradesCtrl'
      .otherwise
        redirectTo: '/'
