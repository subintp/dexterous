class TracksController < ResourceController

  layout 'dashboard'

  skip_before_action :authenticate_user!, only: [:show]
  skip_before_action :load_resource, only: [:show]
  
  def new
    @model ||= Track.new
  end

  def edit
  end

  def create
    @model = Track.new extract_params
    @model.owner = current_user
    @model.save!
    redirect_to controller: 'home', action: 'dashboard'
  rescue
    render action: 'new'
  end

  def show
    @model = Track.includes( :learning_resources, :milestones => [:achievements]).find params[:id]
    head :not_found unless @model.viewable_by? current_user
  end

  private

  def extract_params
    params
      .require(:track)
      .permit(:title, :description, :visibility, :contributability)
  end

end
