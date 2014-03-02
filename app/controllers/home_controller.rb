class HomeController < ApplicationController
  before_filter :authenticate_user!, only: ['dashboard']

  def dashboard
    @enrollments = current_user.enrollments.includes :track
    @new_track = Track.new
    render 'dashboard', layout: 'dashboard'
  end

end
