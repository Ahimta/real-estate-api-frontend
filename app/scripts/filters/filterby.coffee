'use strict'

angular.module('realEstateFrontEndApp')
  .filter 'filterBy', ->
    (input, fkey, selectedId) ->
      if selectedId is undefined
        input
      else
        _.filter input, (element) ->
          element[fkey] == selectedId
