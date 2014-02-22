class Wizard

  attr_accessor :step

  def initialize(el)
    @el = el
    @step = 0
  end

  def dispose_step
    el = @steps[@step]
    el.css('.next').remove()
    el.css('.previous').remove()
  end

  def next_step
    if @step <= @steps.length - 1
      @step += 1
      setup_page
    end
  end

  def prev_step
    if @step > 0
      @step -= 1
      setup_page
    end
  end

  def setup_page
    i = 0
    step = @step
    @steps.each do |el|
      display = 'none'
      display = 'block' if i == step
      el.style display: display
      i += 1
    end

    if step > 0
      @prev_el.style display: 'inline-block'
    else
      @prev_el.style display: 'none'
    end

    if step < @steps.length - 1
      @next_el.style display: 'inline-block'
    else
      @next_el.style display: 'none'
    end
  end

  def setup_paginator

    footer = @el.css('.wizard-footer')[0]
    footer << DOM {
      div.pagination_wrapper {
        a({class: 'prev pure-button-secondary pure-button'}) { "Previous" }
        a({class: 'next pure-button-primary pure-button'}) { "Next" }
      }
    }
    @prev_el = footer.at_css '.prev'
    @next_el = footer.at_css '.next'
    @prev_el.on 'click' do |e|
      prev_step
    end
    @next_el.on 'click' do |e|
      next_step
    end
  end

  def setup
    @steps = @el.css '.step'
    setup_paginator
    setup_page
  end

end

$document.ready do
  $document.css('.wizard').each do |el|
    Wizard.new(el).setup()
  end
end
