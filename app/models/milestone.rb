class Milestone < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = "TrackItemAuthorizer"

  belongs_to :track
  belongs_to :owner, class_name: 'User'
  has_many :learning_resources
  has_many :achievements
  has_many :achievers, through: :achievements, source: :user
end
