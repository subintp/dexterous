class Contributor < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  belongs_to :user
  belongs_to :associator, class_name: 'User'
end
