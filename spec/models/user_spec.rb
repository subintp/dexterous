require 'spec_helper'

describe User do
  it { is_expected.to have_many :contributors }
  it { is_expected.to have_many(:tracks).through(:contributors) }
  it { is_expected.to have_many(:created_tracks) }
end
