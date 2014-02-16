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

  describe "contributors" do

    before :each do
      @track = create(:track)
      @user = create(:user)
    end

    context "having viewer priviledge" do
      before :each do
        @contributor = create :track_contributor, target: @track, user: @user, can_view: true
      end

      it "can view" do
        expect(@track.viewable_by? @user).to be true
      end

      it "can not edit" do
        expect(@track.editable_by? @user).to be false
      end

      it "can not delete" do
        expect(@track.deletable_by? @user).to be false
      end

      it "can share with viewers" do
        expect(@track.sharable_by? @user, permissions: {can_view: true }).to be true
      end

      it "can not share with editors" do
        expect(@track.sharable_by? @user, permissions: {can_edit: true}).to be false
      end

      it "can not share with administrators" do
        expect(@track.sharable_by? @user, permissions: {is_admin: true}).to be false
      end

    end

    context "having editor priviledge" do

      before :each do
        @contributor = create :track_contributor, target: @track, user: @user, can_edit: true
      end

      it "can view" do
        expect(@track.viewable_by? @user).to be true
      end

      it "can edit" do
        expect(@track.editable_by? @user).to be true
      end

      it "can not delete" do
        expect(@track.deletable_by? @user).to be false
      end

      it "can share with viewers" do
        expect(@track.sharable_by? @user, permissions: {can_view: true }).to be true
      end

      it "can not share with editors" do
        expect(@track.sharable_by? @user, permissions: {can_edit: true}).to be false
      end

      it "can not share with administrators" do
        expect(@track.sharable_by? @user, permissions: {is_admin: true}).to be false
      end

    end

    context "having admin priviledge" do

      before :each do
        @contributor = create :track_contributor, target: @track, user: @user, is_admin: true
      end

      it "can view" do
        expect(@track.viewable_by? @user).to be true
      end

      it "can edit" do
        expect(@track.editable_by? @user).to be true
      end

      it "can delete" do
        expect(@track.deletable_by? @user).to be true
      end

      it "can share with viewers" do
        expect(@track.sharable_by? @user, permissions: {can_view: true }).to be true
      end

      it "can share with editors" do
        expect(@track.sharable_by? @user, permissions: {can_edit: true}).to be true
      end

      it "can share with administrators" do
        expect(@track.sharable_by? @user, permissions: {is_admin: true}).to be true
      end

    end

  end
end
