class dx.Endpoint
    @instance: ->
        @_instance ?= new this()
    index: (data)->
        $.ajax
            type: 'get'
            url: @baseUrl
            data: data
    create: (data)->
        $.ajax
            type: 'post'
            url: @baseUrl
            data: data
    show: (id)->
        $.ajax
            type: 'get'
            url: "#{@baseUrl}/#{id}"
    update: (id, data)->
        $.ajax
            type: 'put'
            url: "#{@baseUrl}/#{id}"
            data: data
    destroy: ->
        $.ajax
            type: 'delete'
            url: "#{@baseUrl}/#{id}"
    constructor: (@baseUrl)->

