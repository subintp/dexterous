class TrackItemAuthorizer < Authority::Authorizer

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
