class Permission < ActiveRecord::Base
    belongs_to :user
    belongs_to :track

    validates :user_id, :track_id, presence: true
    validates :can_view,
        inclusion: { in: [true]},
        if: Proc.new {|p| p.can_edit }
    validates :can_edit,
        inclusion: { in: [true]},
        if: Proc.new {|p| p.can_manage }
end
