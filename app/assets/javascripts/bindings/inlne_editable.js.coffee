ko.bindingHandlers.inlineEditable =
  init: (el, accessor)->
    el.on 'click', (e)->
        unless el.hasClass 'under-edit'
            el.addClass 'under-edit'
            $('<input>')
                .css
                    height: el.height()
                    width: el.width()
                .appendTo(el.html(''))

  update: (el, accessor)->
