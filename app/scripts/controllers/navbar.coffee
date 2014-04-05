'use strict'

angular.module('realEstateFrontEndApp')
  .controller 'NavbarCtrl', ($scope, $location) ->
    
    $scope.isActive = (path) ->
      "##{$location.url()}" == path

    $scope.items =
      trades:
        name: 'الفئات'
        path: '#/trades'
      shops:
        name: 'المحلات'
        path: '#/shops'
      workers:
        name: 'العمال'
        path: '#/workers'
      ideas:
        name: 'الأفكار'
        path: '#/ideas'
      # materials:
      #   name: 'المواد'
      #   path: '#/materials'
