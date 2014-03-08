#= require ./view_model
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Achievement extends dx.ViewModel
    @staticProps: ['milestone_id', 'created_at', 'id']
    @observables: ['duration', 'updated_at', 'isComplete']
    @ignored: ['created_at', 'updated_at', 'isComplete']
    @endpoint: 'achievements'

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

    toggleCompletion: (achievement, event)->
        $(event.target).one 'mouseout', =>
            if @isComplete()
                console.log 2
                @isComplete false
                if @id?
                    @destroy()
                        .done => @milestone.achievements.remove @
                        .error => @isComplete true
                @isComplete false
            else
                console.log 3
                @isComplete true
                xhr = @save()
                xhr?.error => @isComplete false
                xhr?.done => @milestone.achievements.remove @
