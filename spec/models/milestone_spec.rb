require 'spec_helper'

describe Milestone do
    describe "attributes" do
        %w{title description created_at updated_at expected_duration score}.each do |field|
            it "include #{field}" do
            expect(Milestone.attribute_names).to include field
            expect(Milestone.column_names).to include field
            end
        end
    end

    it { is_expected.to belong_to(:owner).class_name('User') }
    it { is_expected.to belong_to :track }
    it { is_expected.to have_many(:achievements) }
    it { is_expected.to have_many(:achievers)
        .through(:achievements)
        .source(:user)
    }
    it { is_expected.to have_many(:learning_resources) }
    
    it "validates presence of track_id" do
        expect(Milestone.new).to have(1).error_on(:track_id)
    end
    
    it "validates presence of owner_id" do
        expect(Milestone.new).to have(1).error_on(:owner_id)
    end
end
