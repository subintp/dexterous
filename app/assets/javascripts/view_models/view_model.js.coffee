class dx.ViewModel

    _unwrapProp: (prop)->
        name: prop.name || prop
        origName: prop.origName || prop.name || prop
        type: prop.type

    _unwrapVal: (prop, val)->
        val ?= prop.defaultVal
        if prop.type?
            new prop.type val
        else
            val

    constructor: (params)->
        params ?= {}

        _.each @constructor.staticProps, (prop)=>
            prop = @_unwrapProp prop
            @[prop.name] = @_unwrapVal prop, params[prop.origName]

        _.each @constructor.observables, (prop)=>
            _prop = @_unwrapProp prop
            @[_prop.name] = ko.observable @_unwrapVal _prop, params[_prop.origName]

        _.each @constructor.observableArrays, (prop)=>
            _prop = @_unwrapProp prop
            @[_prop.name] = ko.observableArray _.map params[_prop.origName], (item)=>
                @_unwrapVal _prop, item

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
