init = (tag)->
    (el, accessor)->
        el = $ el
        el.on 'click', (e)->
            return if el.hasClass 'under-edit'
            
            endEdit = ->
                el.removeClass 'under-edit'
                false

            accept = ->
                accessor() input.val()
                endEdit()
                
            reject = ->
                el.text accessor()()
                endEdit()

            container = $('<div class="editable-inner">')
                .prependTo el

            input = $("<#{tag}>")
                .css
                    height: el.height()
                    width: el.width() - 60
                .appendTo(container)
                .val(accessor()())
                .focus()
                .blur accept
                .keydown (e)->
                    switch e.which
                        when 27 # escape
                            reject()
                        when 13 # enter
                            accept() if tag == 'input' or e.ctrlKey

            container.addClass('under-edit')
                .append(
                    '''
                    <div class="rfloat">
                        <a class="editable-submit">
                            <i class="fa fa-check-circle-o" />
                        </a>
                        <a class="editable-reject">
                            <i class="fa fa-times-circle-o" />
                        </a>
                    </div>
                    '''
                )
                .on 'click', '.editable-submit', accept
                .on 'click', '.editable-reject', reject

            el.find('.default').hide()

update = (el, accessor)->
    val = accessor()()
    el = $ el
    if _.isString(val) and val.length > 0
        el.find('.editable-inner').text(val)
        el.find('.default').hide()
    else
        el.find('.editable-inner').text('')
        el.find('.default').show()

ko.bindingHandlers.inlineEditable =
    init: init 'input'
    update: update

ko.bindingHandlers.inlineBoxEditable =
    init: init 'textarea'
    update: update
