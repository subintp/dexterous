#= require ./application

$ ->
    h = $('body').height() - $('#dashboard>header').height() - $('#dashboard>footer').height()
    $('#tracks-container').height h
    $('.track-wrapper').height h
