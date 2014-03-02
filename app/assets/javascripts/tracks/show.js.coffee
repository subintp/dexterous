#= require ../application
#= require knockout
#= require jquery.timeago

#= require_tree ../bindings
#= require_tree ../view_models
#= require_tree ../endpoints

@app = {}

@app.viewModels =
    track: null
    freshMilestone: ko.observable(new dx.Milestone)
    milestones: ko.observableArray()
    learningResources: ko.observableArray()

@app.endpoints =
    milestones: new dx.Endpoint('/milestones')
    learning_resources: new dx.Endpoint('/learning_resources')
