class LearningResource < ActiveRecord::Base
  belongs_to :milestone
  belongs_to :track
end
