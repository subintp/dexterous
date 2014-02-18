# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :learning_resource do
    title 'rails guides'
    track factory: :track
    owner factory: :user
    url 'example.com'
  end
end
