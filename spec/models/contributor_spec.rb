require 'spec_helper'

describe Contributor do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to(:associator).class_name('User') }
  it { is_expected.to belong_to :target }

  it "can_read if (s)he can_edit" do
    track = create :track_contributor, can_edit: true
    expect(track.can_read).to be true
  end

end
