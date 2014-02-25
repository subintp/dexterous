#= require jquery

$.fn.popover = ->
    popup = $("##{$(this).attr('id').replace('thumb', 'popup')}")
    show = ->
        popup.show()
        $('body').on 'click', hide
        popup.on 'click', (e)-> e.stopPropagation()
        false
    hide = ->
        popup.hide()
        $('body').off 'click', hide
        false

    $(this).on 'click', show

$('#login-thumb').popover()
$('#register-thumb').popover()

