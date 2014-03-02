#= require ./view_model
#= require ./milestone

class dx.Track extends dx.ViewModel
    @staticProps: ['id', 'owner_id', 'created_at']
    @observables: ['name', 'description', 'freshMilestone']

    genFreshMilestone: ->
        fm = new dx.Milestone track_id: @id
        save = fm.save
        fm.save = ->
            save.apply(this, arguments)
                .done (data)->
                    app.viewModels.milestones.push new dx.Milestone data
                    fm.purge()

        @freshMilestone fm
            
    constructor: ->
        super
        @genFreshMilestone()

    saveFresh: ->
        alert 'ping'
