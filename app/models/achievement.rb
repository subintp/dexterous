class Achievement < ActiveRecord::Base
    belongs_to :enrollment
    has_one :user, through: :enrollment
    belongs_to :milestone
    
    validates :enrollment_id, :milestone_id, presence: true
end
