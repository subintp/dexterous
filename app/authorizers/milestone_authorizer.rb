class MilestoneAuthorizer < Authority::Authorizer
  def self.creatable_by?(user, config)
    if config[:track_id].nil?
      false
    else
      Contributor.where(
        target_type: 'track',
        target_id: config[:track_id],
        user_id: user.id,
        can_edit: true
      ).length > 0
    end
  end
end
