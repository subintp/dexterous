#= require ./view_model
#= require ./learning_resource
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
        learningResource = new dx.LearningResource
        learningResource.title 'hello world'
        learningResource.url 'hello.com'

        $('<div>')
            .avgrund
                width: 400
                height: 280
                showClose: true
                template: $ '#milestone-form-wrapper'
            .click()
        ko.applyBindings learningResource, $('.avgrund-popin')[0]
