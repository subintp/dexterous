class MilestonesController < ResourceController

  private

  def extract_params
      params
          .require(:milestone)
          .permit(:title, :description, :expected_duration, :track_id)
  end

end
