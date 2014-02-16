class Contributor < ActiveRecord::Base

  belongs_to :target, polymorphic: true
  belongs_to :user
  belongs_to :associator, class_name: 'User'
  before_save :backfill_lower_permissions

  private

  def backfill_lower_permissions
    self.can_edit ||= is_admin
    self.can_read ||= can_edit
  end

end
