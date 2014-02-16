class TrackAuthorizer < Authority::Authorizer
  def self.creatable_by?(user)
    true
  end

  def viewable_by?(user)
    resource.contributors.where(user: user, can_view: true).length > 0
  end

  def editable_by?(user)
    resource.contributors.where(user: user, can_edit: true).length > 0
  end

  def deletable_by?(user)
    resource.contributors.where(user: user, is_admin: true).length > 0
  end

  def sharable_by?(user, config)
    permissions = config[:permissions]
    if permissions.nil?
      false
    else
      reqd_permission = if permissions[:is_admin] || permissions[:can_edit]
                          :is_admin
                        elsif permissions[:can_view]
                          :can_view
                        end
      resource.contributors.where(user: user, reqd_permission => true).length > 0
    end
  end
end
