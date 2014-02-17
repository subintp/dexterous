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

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:milestone) }
end
