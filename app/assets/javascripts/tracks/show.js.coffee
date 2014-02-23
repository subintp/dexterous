#= require ../application
#= require knockout
#= require_tree ../bindings
#= require_tree ../view_models
#= require_tree ../endpoints

@app = {}

@app.viewModels =
    track: null
    newMilestone:
        title: ko.observable()
        description: ko.observable()
        save: ->
            app.endpoints.milestones
                .create
                    title: @title()
                    description: @description()
                    track_id: app.viewModels.track.id
                .then (data)=>
                    app.viewModels.milestones.push data
                    @title ''
                    @description ''

    milestones: ko.observableArray()
    learningResources: ko.observableArray()

@app.endpoints =
    milestones: new dx.Endpoint('/milestones')
