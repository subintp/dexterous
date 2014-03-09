class HomeController < ApplicationController
    before_filter :authenticate_user!, only: ['dashboard']

    def dashboard
        @enrollments = current_user.enrollments
            .includes :achievements, track: :milestones
        achievements = {}
        @enrollments.each do |en|
            en.achievements.each do |ach|
                achievements[ach.milestone_id] = ach
            end
        end
        @achievements = achievements
        render 'dashboard'
    end
end
