'use strict'

angular.module('realEstateFrontEndApp')
  .filter 'filterBy', ->
    (input, fkey, selectedId) ->
      if selectedId is undefined
        input
      else
      	element for element in input when element[fkey] == selectedId
