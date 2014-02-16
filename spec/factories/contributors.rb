# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track_contributor, class: 'Contributor' do
    user
    association :target, factory: :track
  end
end
