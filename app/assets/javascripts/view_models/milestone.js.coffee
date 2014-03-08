#= require ./view_model
#= require ./learning_resource
#= require ./achievement
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel

    @staticProps: ['id', 'track_id', 'created_at', 'editable', 'deletable']
    @observables: [
        'title', 'description', 'updated_at', 'expected_duration',
        'resourcesTab', 'beingEdited', 'isBusy', 'freshResource',
        'freshAchievement', 'currentResource'
    ]
    @observableArrays: [
        { name: 'achievements', type: dx.Achievement },
        { name: 'learningResources', type: dx.LearningResource, origName: 'learning_resources' }
    ]
    @endpoint: 'milestones'
    @ignored: [
        'beingEdited', 'isBusy', 'freshResource',
        'resources', 'editable', 'deletable'
    ]

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

    genFreshResource: ->
        @freshResource new dx.LearningResource track_id: @track_id, milestone_id: @id

    constructor: ->
        super
        @_pristine = {}
        @genFreshResource()

        @achievement = ko.computed =>
            if @achievements().length > 0
                a = @achievements()[0]
                a.isComplete true
            else
                a = new dx.Achievement milestone_id: @id, isComplete: false
            a.milestone = @
            a

    toggleResourceList: ->
        @resourcesTab if @resourcesTab() == 'list' then null else 'list'

    toggleNewResourceForm: ->
        @resourcesTab if @resourcesTab() == 'create' then null else 'create'

    startEditResource: (res)->
        @currentResource res
        @resourcesTab 'edit'

    closeDropdown: ->
        @resourcesTab null

    cancelEdit: ->
        @title @_pristine.title
        @description @_pristine.description
        @beingEdited false

    startEdit: ->
        @beingEdited true
        _.extend @_pristine,
            title: @title()
            description: @description()

    startDelete: ->
        if confirm 'Are you sure?'
            @isBusy true
            @destroy().done => app.viewModels.milestones.remove @

    startSave: ->
        @isBusy true
        @save().done =>
            @isBusy false
            @beingEdited false
            @_prisine = null

    initialize: ->
        super
