#= require ../application
#= require knockout
#= require jquery.timeago
#= require jquery.color

#= require_tree ../bindings
#= require_tree ../view_models
#= require_tree ../endpoints

# Setup View Models for Knockout
# ==============================

@app = {}

@app.viewModels =
    track: null
    milestones: ko.observableArray()
    learningResources: ko.observableArray()

@app.endpoints =
    milestones: new dx.Endpoint('/milestones')
    learning_resources: new dx.Endpoint('/learning_resources')

# Minor UI adjustments
# ====================

$ ->
    dashboard = $ '#dashboard'
    win = $ window
    if dashboard.outerHeight() < win.height()
        dashboard
            .children('.body')
            .css('min-height', win.height() - dashboard.children('header').outerHeight() - dashboard.children('footer').outerHeight())

    $('body').on 'click', 'form .row', ->
        $(this)
            .find('input,textarea')
            .focus()
            .css('background-color', 'lemonchiffon')
            .animate({'background-color': 'transparent'}, 1000)
