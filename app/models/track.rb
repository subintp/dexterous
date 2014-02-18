class Track < ActiveRecord::Base
  include Authority::Abilities

  belongs_to :owner, class_name: 'User'
  has_many :permissions

  # visibility:
  # ----------
  #   open       => Is visible to all users, guests and search engines
  #   public     => Is visibile to any signed in users,
  #                 except possibly blacklisted users
  #   restricted => Is visible to whitelisted set of users
  #   private    => Visible only to owner
  validates :visibility, inclusion: {
    in: %w{public open restricted private}
  }

  # contributability:
  # ----------------
  #   public     => Any signed in user, with the exception of blacklisted users,
  #                 can make contribution
  #   permissive => Any signed in user, with the exception of blacklisted users
  #                 can suggest contribution, which will need to be moderated by
  #                 an editor/contributor
  #   restricted => Explicitly whitelisted set of contributors can contribute
  #   forbidden  => Only owner can contribute
  validates :contributability, inclusion: {
    in: %w{public permissive restricted forbidden }
  }
end
