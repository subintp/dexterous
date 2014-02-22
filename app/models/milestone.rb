class Milestone < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = "TrackItemAuthorizer"

  belongs_to :track
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :enrollments
  has_many :completers,
    through: :enrollments,
    source: :user
end
