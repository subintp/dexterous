class TrackItemAuthorizer < Authority::Authorizer

  def self.creatable_by?(user, config)
    track = config[:track]
    not track.nil? and track.contributable_by? user
  end

  def viewable_by?(user)
    resource.track.viewable_by? user
  end

  def editable_by?(user)
    resource.owner_id == user.id or
      resource.track.editable_by? user
  end

  def deletable_by?(user)
    resource.owner_id == user.id or
      resource.track.editable_by? user
  end

end
