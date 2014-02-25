#= require ./view_model
#= require ../endpoints/endpoint
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.Milestone extends dx.ViewModel
    @staticProps: ['id', 'track_id', 'created_at', 'editable', 'deletable']
    @observables: ['title', 'description', 'updated_at']
    @endpoint: 'milestones'

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable
    
