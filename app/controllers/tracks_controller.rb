class TracksController < ApplicationController
  layout 'dashboard'
  before_filter :authenticate_user!, except: [:show]

  def new
    @track ||= Track.new
  end

  def create
    @track = Track.new params
      .require(:track)
      .permit(:title, :description, :visibility, :contributability)
    @track.owner = current_user
    @track.save!
    redirect_to controller: 'home', action: 'dashboard'
  rescue
    render action: 'new'
  end

  def show
    @track = Track.includes(:milestones, :learning_resources).find params[:id]
    head :not_found unless @track.viewable_by? current_user
  end

end
