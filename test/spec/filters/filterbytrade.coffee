'use strict'

describe 'Filter: filterByTrade', ->

  # load the filter's module
  beforeEach module 'realEstateFrontEndApp'

  # initialize a new instance of the filter before each test
  filterByTrade = {}
  beforeEach inject ($filter) ->
    filterByTrade = $filter 'filterByTrade'

  it 'should return the input prefixed with "filterByTrade filter:"', ->
    text = 'angularjs'
    expect(filterByTrade text).toBe ('filterByTrade filter: ' + text)
