require 'spec_helper'

describe Contributor do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to(:associator).class_name('User') }
  it { is_expected.to belong_to :target }

  it "can_read if (s)he can_edit" do
    track = create :track_contributor, can_edit: true
    expect(track.can_read).to be true
  end

  it "can_edit and can_read if (s)he is_admin" do
    track = create :track_contributor, is_admin: true
    expect(track.can_read).to be true
    expect(track.can_edit).to be true
  end

end
