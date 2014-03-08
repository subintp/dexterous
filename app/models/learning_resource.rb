class LearningResource < ActiveRecord::Base

    include Authority::Abilities
    self.authorizer_name = "TrackItemAuthorizer"

    belongs_to :milestone
    belongs_to :track
    belongs_to :owner, class_name: 'User'

    validates :track_id, :title, presence: true
    validates :url, format: {
        with: /\A(https?|ftp):\/\/(www\d?|[a-zA-Z0-9]+)?\.[a-zA-Z0-9-]+(\:|\.)([a-zA-Z0-9.]+|(\d+)?)([\/?:].*)?\z/
    }
end
