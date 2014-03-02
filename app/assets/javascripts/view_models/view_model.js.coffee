class dx.ViewModel

    constructor: (params)->
        params ?= {}

        _.each @constructor.staticProps, (prop)=>
            @[prop] = params[prop] || null

        _.each @constructor.observables, (prop)=>
            @[prop] = ko.observable params[prop]

        _.each @constructor.observableArrays, (prop)=>
            @[prop] = ko.observableArray params[prop]

    update: (params)-> @_update params, false
    patch: (params)-> @_update params, true

    _update: (params, patch)->
        params ?= {}
        c = @constructor

        for prop in c.staticProps
            unless patch and _.isEmpty params[prop]
                @[prop] = params[prop] || null

        for arr in [c.observables, c.observableArrays]
            for prop in arr
                unless patch and _.isEmpty params[prop]
                    @[prop] params[prop]
        
    purge: ->
        _.each @constructor.observables, (prop)=>
            @[prop] null
        _.each @constructor.observableArrays, (prop)=>
            @[prop].removeAll()
