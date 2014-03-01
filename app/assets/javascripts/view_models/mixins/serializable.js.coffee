dx.mixin.serializable =
    toJSON: ->
        o = {}
        c = @constructor
        ignored = c.ignored || []
        _.reduce c.staticProps, (o, name)=>
                return o if _.include ignored, name
                o[name] = @[name]
                o
            , o
        _.reduce c.observables, (o, name)=>
                return o if _.include ignored, name
                o[name] = @[name]()
                o
            , o
        _.reduce c.obserableArrays, (o, name)=>
                return o if _.include ignored, name
                o[name] = _.map @[name](), (item)->
                    if item instanceof dx.ViewModel
                        item.toJSON()
                    else
                        item
                o
            , o
