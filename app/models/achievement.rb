class Achievement < ActiveRecord::Base
    belongs_to :enrollment
    belongs_to :user, through: :enrollment
    belongs_to :milestone
end
