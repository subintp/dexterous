require 'spec_helper'

describe Milestone do
  describe "attributes" do
    it "include title, description created_at update_at" do
      %w{title description created_at updated_at deadline score}.each do |field|
        expect(Milestone.attribute_names).to include field
      end
    end
  end

  it { is_expected.to belong_to(:creator).class_name('User') }
  it { is_expected.to belong_to :track }

  it "can be created by users who can edit corresponding track" do
    contributor = create(:track_contributor,
      target: create(:track),
      user: create(:user),
      can_view: true
    )
    expect(Milestone.creatable_by?(contributor.user,
        track_id: contributor.target.id )).to be false
    contributor.update can_edit: true
    expect(Milestone.creatable_by?(contributor.user,
        track_id: contributor.target.id )).to be true
  end
end
