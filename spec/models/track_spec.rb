require 'spec_helper'

describe Track do

  describe "attributes" do

    it "include title, description" do
      %w{title description created_at updated_at}.each do |field|
        expect(Track.attribute_names).to include field
      end
    end

  end

  it { is_expected.to belong_to(:creator).class_name('User') }
  it { is_expected.to have_many(:contributors) }

  it "is creatable by any user" do
    expect(Track.creatable_by? build(:user)).to be true
  end

  describe "creator" do
    it "is added as contributor after track is saved" do
      track = create(:track)
      expect(track.contributors.first.user_id).to eq track.creator.id
    end
  end
end
