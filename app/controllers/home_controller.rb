class HomeController < ApplicationController
  before_filter :authenticate_user!, only: ['dashboard']

  def dashboard
    @tracks = current_user.enrolled_tracks.includes :milestones
    @new_track = Track.new
    render 'dashboard', layout: 'dashboard'
  end

end
