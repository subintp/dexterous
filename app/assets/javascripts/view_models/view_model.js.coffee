class @ViewModel
    serialize: ->
        if @constructor.serializable?
            
        else
            # Serialize everything 

    constructor: (params)->
        params ?= {}

        _.each @constructor.staticProps, (prop)=>
            @[prop] = params[prop] || null

        _.each @constructor.observables, (prop)=>
            @[prop] = ko.observable params[prop]

        _.each @constructor.observableArrays, (prop)=>
            @[prop] = ko.observableArray params[prop]
