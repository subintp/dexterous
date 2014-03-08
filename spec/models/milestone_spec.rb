require 'spec_helper'

describe Milestone do
    describe "attributes" do
        it "include title, description created_at update_at" do
            %w{title description created_at updated_at expected_duration score}.each do |field|
                expect(Milestone.attribute_names).to include field
                expect(Milestone.column_names).to include field
            end
        end
    end

    it { is_expected.to belong_to(:owner).class_name('User') }
    it { is_expected.to belong_to :track }
end
