#= require ./view_model
#= require ./learning_resource
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel
    @name: 'milestone'
    @staticProps: ['id', 'track_id', 'created_at', 'editable', 'deletable']
    @observables: ['title', 'description', 'updated_at', 'resourcesTab', 'beingEdited', 'isBusy']
    @observableArrays: ['resources']
    @endpoint: 'milestones'

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

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

