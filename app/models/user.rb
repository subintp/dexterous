class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Authority::UserAbilities

  has_many :permissions
  has_many :tracks, through: :permissions
  has_many :enrollments

  {
    view:       :viewable,
    edit:       :editable,
    contribute: :contributable,
    manage:     :manageable
  }.each do |verb, adjective|

    has_many :"#{verb}_permissions", {
        class_name: 'Permission'
      }, -> { where(:"can_#{verb}" => true) }

    has_many :"#{adjective}_tracks",
      source: 'track',
      through: :"#{verb}_permissions"

  end

  %w{Track Milestone LearningResource}.each do |resource|

    has_many :"owned_#{resource.underscore.pluralize}",
      inverse_of: :owner,
      class_name: resource

  end

end
