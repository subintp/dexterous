#= require ./view_model

class dx.Track extends dx.ViewModel
    @staticProps: ['id', 'owner_id', 'created_at']
    @observables: ['name', 'description']
