class Subscription < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user
    has_many :updates, through: :topic
end
