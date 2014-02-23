ko.bindingHandlers.timeago =
    update: (el, accessor)->
        $(el).attr('title', ko.unwrap(accessor)()).timeago()

        
