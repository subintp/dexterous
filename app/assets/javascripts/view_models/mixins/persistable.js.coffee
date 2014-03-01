dx.mixin.persistable =
    endpoint: ->
        app.endpoints[@constructor.endpoint]
    save: ->
        obj = {}
        obj[@constructor.name.toLowerCase()] = @toJSON()
        if @id?
            @endpoint().update @id, obj
        else
            @endpoint().create obj
    destroy: ->
        if @id?
            @endpoint().destroy @id
