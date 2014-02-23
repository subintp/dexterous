#= require ../application
#= require knockout
#= require_tree ../bindings
#= require_tree ../view_models


@vm = 
  track: null
  newMilestone:
    title: ko.observable()
    description: ko.observable()
    save: ->
        $.ajax
            type: 'post'
            
  milestones: ko.observableArray()
  learningResources: ko.observableArray()

