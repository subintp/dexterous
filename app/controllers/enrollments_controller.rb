class EnrollmentsController < ApplicationController
    before_filter :authenticate_user!

    def index
        render json: current_user.enrollments
            .includes(:achievements, track: [:milestones])
    end
end
