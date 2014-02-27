#= require jquery


# ------------------------------------------------------
# popovers
# ------------------------------------------------------

$.fn.popover = ->
    popup = $("##{$(this).attr('id').replace('thumb', 'popup')}")
    show = ->
        $('.popup-form:visible').hide()
        popup.show()
        $('body').on 'click', hide
        popup.on 'click', (e)-> e.stopPropagation()
        false
    hide = ->
        popup.hide()
        $('body').off 'click', hide
        false
    toggle = ->
        if popup.is ':visible'
            show()
        else
            hide()
    $(this).on 'click', show

$ ->
    loginThumb = $ '#login-thumb'
    if loginThumb.length > 0
        loginThumb.popover()
        $('#register-thumb').popover()

# -------------------------------------------------------
# Pg down btn
# -------------------------------------------------------

$ ->
    # When height is set as 100% then body is not scrollable
    # However, we need to have it for graceful degradation
    # in absence of javascript
    $('#banner').height $(window).height()
    $('body, html').height('auto')

    $('#push-down-thumb')
        .click ->
            $('body').animate
                scrollTop: $('#banner').height()
