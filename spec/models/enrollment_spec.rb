require 'spec_helper'

describe Enrollment do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :track }
  it { is_expected.to have_and_belong_to_many :milestones }
end
