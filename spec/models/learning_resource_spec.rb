require 'spec_helper'

describe LearningResource do
  describe "attributes" do
    it "include url, title" do
      %w{url title}.each do |field|
        expect(LearningResource.attribute_names).to include field
        expect(LearningResource.column_names).to include field
      end
    end
  end
  it { is_expected.to belong_to(:milestone) }
  it { is_expected.to belong_to(:track) }
end
