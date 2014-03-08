require 'spec_helper'

describe Achievement do
    describe "attributes" do
        it "include duration, score" do
            %w{duration score}.each do |field|
                expect(Achievement.attribute_names).to include field
                expect(Achievement.column_names).to include field
            end
        end
    end

    it { is_expected.to have_one(:user)
        .through(:enrollment)
    }
    it { is_expected.to belong_to(:milestone) }
    it "validates presence of enrollment_id" do
        expect(Achievement.new).to have(1).error_on(:enrollment_id)
    end
    it "validates presence of milestone_id" do
        expect(Achievement.new).to have(1).error_on(:milestone_id)
    end
end
