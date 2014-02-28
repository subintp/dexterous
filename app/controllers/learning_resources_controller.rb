class LearningResourcesController < ResourceController
  private

  def extract_params
    params
      .require(:learning_resource)
      .permit(:url, :title, :description, :metadata, :milestone_id, :track_id)
  end

end
