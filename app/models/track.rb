class Track < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :creator, class_name: 'User'
end
