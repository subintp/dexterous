class AchievementsController < ApplicationController

    before_filter :authenticate_user!

    def create
        @achievement = Achievement.new params
            .require(:achievement)
            .permit(:milestone_id, :duration)
        milestone = Milestone.includes(:track).find(@achievement.milestone_id)
        if milestone.nil? or milestone.track.enrolled_users.where(id: current_user.id).length == 0
            head :not_found
            return
        end
        @achievement.user = current_user
        @achievement.save!
        head :ok
    rescue
        render json: @achievement.errors.full_messages, status: :not_acceptable
    end

    def destroy
        @achievement = Achievement.find params[:id]
        unless @achievement.user_id == current_user.id
            head :not_acceptable
            return
        end
        @achievement.destroy!
        head :ok
    rescue
        render json: @achievement.errors.full_messages, status: :not_acceptable
    end

end
