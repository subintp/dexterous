class @ViewModel
    constructor: (params)->
        staticProps = @constructor.staticProps || []
        observables = @constructor.observables || []
        observableArrays = @constructor.observableArrays || []
        params ?= {}

        _.each staticProps, (prop)=>
            @[prop] = params[prop] || null

        _.each observables, (prop)=>
            @[prop] = ko.observable params[prop]

        _.each observableArrays, (prop)=>
            @[prop] = ko.observableArray params[prop]
