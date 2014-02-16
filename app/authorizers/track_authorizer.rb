class TrackAuthorizer < Authority::Authorizer
  def self.creatable_by?(user)
    true
  end
end
