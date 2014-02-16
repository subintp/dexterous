class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Authority::UserAbilities

  has_many :contributors
  has_many :tracks, through: :contributors, as: :target
  has_many :created_tracks, inverse_of: :creator, class_name: 'Track'

end
