class Milestone < ActiveRecord::Base
  belongs_to :track
  belongs_to :creator, class_name: 'User'
end
