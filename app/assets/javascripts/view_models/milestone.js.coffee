#= require ./view_model
#= require ./learning_resource
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel
    @staticProps: ['id', 'track_id', 'created_at', 'editable', 'deletable']
    @observables: ['title', 'description', 'updated_at', 'resourcesTab', 'beingEdited', 'isBusy', 'freshResource']
    @observableArrays: ['resources']
    @endpoint: 'milestones'
    @ignored: ['beingEdited', 'isBusy', 'freshResource', 'resources', 'editable', 'deletable']

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

    constructor: ->
        super
        @freshResource new dx.LearningResource track_id: @track_id, milestone_id: @id

    toggleResourceList: ->
        @resourcesTab if @resourcesTab() == 'list' then null else 'list'

    toggleNewResourceForm: ->
        @resourcesTab if @resourcesTab() == 'create' then null else 'create'

    closeDropdown: ->
        @resourcesTab null

    cancelEdit: ->
        @beingEdited false

    startEdit: ->
        @beingEdited true

    startDelete: ->
        if confirm 'Are you sure?'
            @isBusy true
            @destroy()
                .then =>
                    app.viewModels.milestones.remove @
