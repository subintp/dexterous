class MilestonesController < ApplicationController
  before_filter :authenticate_user!

  def create
    @milestone = Milestone.new params.permit :title, :description, :aexpected_duration, :track_id
    @milestone.owner = current_user
    @milestone.save!
    render json: @milestone
  rescue
    render json: @milestone.errors.full_messages
  end

end
