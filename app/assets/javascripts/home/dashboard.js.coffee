#= require ../application
#= require blocksit
#= require jquery.avgrund

$ ->
    $('#tracks').BlocksIt
        blockElement: 'li.track'
        numOfCol: 3

    $('.nums').click ->
        el = $ @
