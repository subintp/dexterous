require 'spec_helper'

describe Contributor do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to(:requester).class_name('User') }
  it { is_expected.to belong_to(:approver).class_name('User') }
  it { is_expected.to belong_to :target }

  it "can_view if (s)he can_edit" do
    track = create :track_contributor, can_edit: true
    expect(track.can_view).to be true
  end

  it "can_edit and can_view if (s)he is_admin" do
    track = create :track_contributor, is_admin: true
    expect(track.can_view).to be true
    expect(track.can_edit).to be true
  end

end
