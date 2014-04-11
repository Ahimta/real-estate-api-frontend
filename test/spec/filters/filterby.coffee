'use strict'

describe 'Filter: filterBy', ->

  # load the filter's module
  beforeEach module 'realEstateFrontEndApp'

  # initialize a new instance of the filter before each test
  filterBy = {}
  input    = undefined
  
  beforeEach inject ($filter) ->
    filterBy = $filter 'filterBy'
    input = [{id:1,name:'name1',shop_id:2,trade_id:3},
      {id:2,name:'name2',shop_id:3,trade_id:2},
      {id:3,name:'name3',shop_id:2,trade_id:3},
      {id:4,name:'name4',shop_id:3,trade_id:2}
    ]

  describe 'identity', () ->
    it 'should return the input prefixed with "filterBy filter:"', ->
      expect(filterBy input, 'trade_id', undefined).toEqual input
      expect(filterBy input, 'shop_id', undefined).toEqual input

  describe 'one dimension', () ->
    it 'trade_id', () ->
      expect(filterBy input, 'trade_id', 2).toEqual [
        {id:2,name:'name2',shop_id:3,trade_id:2},
        {id:4,name:'name4',shop_id:3,trade_id:2}
      ]
      expect(filterBy input, 'trade_id', 3).toEqual [
        {id:1,name:'name1',shop_id:2,trade_id:3},
        {id:3,name:'name3',shop_id:2,trade_id:3},
      ]
