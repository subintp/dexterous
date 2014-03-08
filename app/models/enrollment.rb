class Enrollment < ActiveRecord::Base
    belongs_to :user
    belongs_to :track
    has_and_belongs_to_many :milestones
    has_many :achievements
end
