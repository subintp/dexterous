class TracksController < ApplicationController
  layout 'dashboard'

  def new
    @track = Track.new
  end
end
