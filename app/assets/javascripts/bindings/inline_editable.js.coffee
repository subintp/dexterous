init = (tag)->
    (el, accessor)->

        el = $ el
        el.on 'click', (e)->
            return if el.hasClass 'under-edit'

            accept = ->
                accessor() input.val()
                el.removeClass 'under-edit'
                false
                
            reject = ->
                el.text accessor()()
                el.removeClass 'under-edit'
                false
                        
            input = $("<#{tag}>")
                .css
                    height: el.height()
                    width: el.width() - 60
                .appendTo(el.html(''))
                .val(accessor()())
                .focus()
                .blur accept
                .keydown (e)->
                    switch e.which
                        when 27 # escape
                            reject()
                        when 13 # enter
                            accept() if tag == 'input' or e.ctrlKey

            el.addClass('under-edit')
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

update = (el, accessor)-> $(el).text accessor()()

ko.bindingHandlers.inlineEditable =
    init: init 'input'
    update: update

ko.bindingHandlers.inlineBoxEditable =
    init: init 'textarea'
    update: update
