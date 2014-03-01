#= require ./view_model
#= require ./learning_resource
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel
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
        alert 'Are you sure?'
        @isBusy true
