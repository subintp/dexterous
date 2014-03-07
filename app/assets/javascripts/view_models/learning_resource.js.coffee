#= require ./view_model
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.LearningResource extends dx.ViewModel
    @staticProps: ['id', 'track_id', 'editable', 'deletable', 'created_at']
    @observables: ['url', 'title', 'milestone_id', 'description', 'isBusy']
    @endpoint: 'learning_resources'

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

    startDelete: ->
        if confirm 'Are you sure?'
            @isBusy true
            @destroy().done => app.viewModels.learningResources.remove @

    startSave: (milestone)->
        @save().done => milestone.resourcesTab 'list'
