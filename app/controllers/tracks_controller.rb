class TracksController < ApplicationController
  layout 'dashboard'

  def new
    @track ||= Track.new
  end

  def create
    @track = Track.new params
      .require(:track)
      .permit(:title, :description, :visibility)
    @track.save!
    redirect_to controller: 'home', action: 'dashboard'
  rescue
    render action: 'new'
  end
end
