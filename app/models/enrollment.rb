class Enrollment < ActiveRecord::Base
    belongs_to :user
    belongs_to :track
    has_many :achievements
end
