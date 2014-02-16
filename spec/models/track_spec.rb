require 'spec_helper'

describe Track do

  describe "attributes" do
    it "has title, description attributes" do
      %w{title description}.each do |field|
        expect(Track.attribute_names).to include field
      end
    end
  end

end
