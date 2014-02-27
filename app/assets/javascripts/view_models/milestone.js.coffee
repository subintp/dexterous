#= require ./view_model
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel
    @staticProps: ['id', 'track_id', 'created_at', 'editable', 'deletable']
    @observables: ['title', 'description', 'updated_at', 'resourcesVisible']
    @observableArrays: ['resources']
    @endpoint: 'milestones'

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable

    constructor: ->
        super
        @resourcesVisible false

    toggleResources: ->
        @resourcesVisible ! @resourcesVisible()

    initResourceCreation: ->
        $('<div>')
            .avgrund
                width: 380
                height: 280
                showClose: true
                template: $ '#milestone-form-wrapper'
            .click()
