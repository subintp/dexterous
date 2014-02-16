require 'spec_helper'

describe Contributor do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :associator }
  it { is_expected.to belong_to :target }
end
