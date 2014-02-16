class Track < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :creator, class_name: 'User'
  after_create :add_creator_as_contributor
  has_many :contributors, as: 'target'

  private

  def add_creator_as_contributor
    Contributor.create(
      target: self,
      user: creator,
      is_admin: true
    )
  end

end
