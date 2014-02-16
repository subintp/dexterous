require 'spec_helper'

describe Contributor do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to(:associator).class_name('User') }
  it { is_expected.to belong_to :target }
end
