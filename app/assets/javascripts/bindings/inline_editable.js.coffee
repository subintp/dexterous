init = (tag)->
    (el, accessor)->
        el = $ el
        el.on 'click', (e)->
            return if el.hasClass 'under-edit'
            input = $("<#{tag}>")
                .css
                    height: el.height()
                    width: el.width() - 60
                .appendTo(el.html(''))
                .val(accessor()())
                .focus()
            
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
                .on 'click', '.editable-submit', ->
                    accessor() input.val()
                    el.removeClass 'under-edit'
                    false
                .on 'click', '.editable-reject', ->
                    el.text accessor()()
                    el.removeClass 'under-edit'
                    false

update = (el, accessor)-> $(el).text accessor()()

ko.bindingHandlers.inlineEditable =
    init: init 'input'
    update: update

ko.bindingHandlers.inlineBoxEditable =
    init: init 'textarea'
    update: update
