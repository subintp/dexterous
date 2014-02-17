class Milestone < ActiveRecord::Base

  include Authority::Abilities

  belongs_to :track
  belongs_to :creator, class_name: 'User'
end
