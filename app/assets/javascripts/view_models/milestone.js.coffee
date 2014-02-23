#= require ./view_model

class dx.Milestone extends dx.ViewModel
    @staticProps: ['id', 'track_id', 'created_at', 'updated_at']
    @observables: ['title', 'description']
