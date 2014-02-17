class Milestone < ActiveRecord::Base

  include Authority::Abilities

  belongs_to :track
  belongs_to :creator, class_name: 'User'

  def add_creator_as_contributor
    Contributor.create(
      target: self,
      user: creator,
      is_admin: true
    )
  end
end
