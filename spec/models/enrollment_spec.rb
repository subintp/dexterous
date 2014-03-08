require 'spec_helper'

describe Enrollment do
         
  describe "attributes" do
  
    %w{enrolled_at completed_at}.each do |field|
      it "include #{field}" do
        expect(Enrollment.attribute_names).to include field
        expect(Enrollment.column_names).to include field
      end
    end
  end
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :track }
  it { is_expected.to have_many :achievements }
  
  it "validates presence of user_id" do
    e = Enrollment.new
    expect(e).to have(1).error_on(:user_id)
    e.user_id = 1
    expect(e).to have(0).error_on(:user_id)
  end

  it "validates presence of track_id" do
    e = Enrollment.new
    expect(e).to have(1).error_on(:track_id)
    e.track_id = 1
    expect(e).to have(0).error_on(:track_id)
  end
end
