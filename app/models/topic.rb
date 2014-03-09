class Topic < ActiveRecord::Base
    has_many :subscriptions
    has_many :updates
    belongs_to :subject, polymorphic: true
end
