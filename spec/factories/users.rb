# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "user#{i}@mail.com"}
    password "password"
  end
end
