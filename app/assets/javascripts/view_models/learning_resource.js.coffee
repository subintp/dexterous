#= require ./view_model

class dx.LearningResource extends dx.ViewModel
    @staticProps: ['id', 'track_id']
    @observables: ['url', 'title', 'milestone_id', 'description']

