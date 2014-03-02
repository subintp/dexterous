#= require ./view_model
#= require ./mixins/persistable
#= require ./mixins/serializable

class dx.LearningResource extends dx.ViewModel
    @staticProps: ['id', 'track_id']
    @observables: ['url', 'title', 'milestone_id', 'description', 'isBusy']
    @endpoint: 'learning_resources'

    _.extend @prototype, dx.mixin.persistable, dx.mixin.serializable
