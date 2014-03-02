class LearningResourcesController < ResourceController

  before_filter :load_track, only: [:create]

  def create
    if model_class.creatable_by? current_user, track: @track
      @model = model_class.new extract_params
      @model.save!
      render json: @model
    else
      head :not_acceptable
    end
  rescue
    render json: @model.errors.full_messages, status: 406
  end
    
  private

  def extract_params
    params
      .require(:learning_resource)
      .permit(:url, :title, :description, :metadata, :milestone_id, :track_id)
  end

end
