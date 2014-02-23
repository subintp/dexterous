#= require ./view_model

class @Track extends @ViewModel
    staticProps: ['id', 'owner_id', 'created_at']
    observables: ['name', 'description']
