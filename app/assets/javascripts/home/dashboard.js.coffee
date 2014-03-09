#= require ../application
#= require blocksit
#= require jquery.avgrund

$ ->
    $('#tracks').BlocksIt
        blockElement: 'li.track'
        numOfCol: 3

    $('.track').each ->
        $this = $ this
        if $this.find('.milestones li').length > 0
            console.log 'Setting up avgrund'
            $this.find('.num-thumb').avgrund
                width: 380
                height: 280
                template: $this.find('.milestones')
