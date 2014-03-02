#= require ./view_model
#= require ./learning_resource
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel
    @staticProps: ['id', 'track_id', 'created_at', 'editable', 'deletable']
    @observables: ['title', 'description', 'updated_at', 'resourcesTab', 'beingEdited', 'isBusy', 'freshResource']
    @endpoint: 'milestones'
    @ignored: ['beingEdited', 'isBusy', 'freshResource', 'resources', 'editable', 'deletable']

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

    genFreshResource: ->
        fr = new dx.LearningResource track_id: @track_id, milestone_id: @id
        save = fr.save
        _this = this
        fr.save = ->
            _this.isBusy true
            save.apply(this, arguments)
                .done (data)->
                    app.viewModels.learningResources.push new dx.LearningResource data
                    _this.isBusy false
                    _this.resourcesTab 'list'
                    fr.purge
        @freshResource fr

    constructor: ->
        super
        @_pristine = {}
        @genFreshResource()
        @learningResources = ko.computed =>
            _.filter app.viewModels.learningResources(), (res)=>
                res.milestone_id() == @id

    toggleResourceList: ->
        @resourcesTab if @resourcesTab() == 'list' then null else 'list'

    toggleNewResourceForm: ->
        @resourcesTab if @resourcesTab() == 'create' then null else 'create'

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
