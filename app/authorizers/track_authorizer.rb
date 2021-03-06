class TrackAuthorizer < Authority::Authorizer

    def self.creatable_by?(user)
        true
    end

    def viewable_by?(user)

        # Free pass - no queries required
        if not user.nil? and resource.owner_id == user.id
            return true
        end

        case resource.visibility
            when 'open'
                true
            when 'public'
                not user.nil? and
                    resource.permissions.where(
                        user: user,
                        can_view: false
                    ).length == 0
            when 'restricted'
                not user.nil? and resource.permissions.where(
                        user: user,
                        can_view: true
                    ).length > 0
            else
                false
        end
    end

    def editable_by?(user)
        not user.nil? and (
            resource.owner_id == user.id    or
            resource.permissions.where(
                user: user,
                can_edit: true
            ).length > 0
        )
    end

    def deletable_by?(user)
        manageable_by? user
    end

    def sharable_by?(user)
        manageable_by? user
    end

    def manageable_by?(user)
        not user.nil? and (
            resource.owner_id == user.id or
            resource.permissions.where(
                user: user,
                can_manage: true
            ).length > 0
        )
    end

    def contributable_by?(user)
        return false if user.nil?
        return true if resource.owner_id == user.id

        case resource.contributability
            when 'public'
                resource.permissions.where(
                    user: user,
                    can_contribute: false
                ).length == 0
            when 'permissive', 'restricted'
                resource.permissions.where(
                    user: user,
                    can_contribute: true
                ).length > 0
            else
                false
        end
    end

    def suggestively_contributable_by?(user)
        not user.nil? and
            resource.contributability == 'permissive' and
            resource.permissions.where(
                user: user,
                can_contribute: false
            ).length == 0
    end

end
