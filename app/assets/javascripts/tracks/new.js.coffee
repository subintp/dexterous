#= require knockout

wizard_view_model =
  step: ko.observable 0
  decrStep: -> @step @step() - 1
  incrStep: -> @step @step() + 1

ko.applyBindings wizard_view_model
