dx.mixin.serializable =
    toJSON: ->
        o = {}
        _.reduce @constructor.staticProps, (o, name)=>
                o[name] = @[name]
                o
            , o
        _.reduce @constructor.observables, (o, name)=>
                o[name] = @[name]()
                o
            , o
        _.reduce @constructor.obserableArrays, (o, name)=>
                o[name] = _.map @[name](), (item)->
                    if item instanceof dx.ViewModel
                        item.toJSON()
                    else
                        item
                o
            , o
