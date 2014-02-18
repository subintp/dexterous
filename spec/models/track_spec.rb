require 'spec_helper'

describe Track do

  describe "attributes" do

    it "include title, description created_at update_at" do
      %w{title description created_at updated_at}.each do |field|
        expect(Track.attribute_names).to include field
        expect(Track.column_names).to include field
      end
    end

  end

  it { is_expected.to belong_to :owner }

  it "can be created by any user" do
    expect(Track.creatable_by? build(:user)).to be true
  end

  context "with public visibility" do


    it "can be viewed by any user" do

    end

  end
end
