dx.mixin.persistable =
    endpoint: ->
        app.endpoints[@constructor.endpoint]
    save: ->
        if @id?
            @endpoint().create @toJSON()
        else
            @endpoint().update @id, @toJSON()
    destroy: ->
        if @id?
            @endpoint().destroy @id

    
        
