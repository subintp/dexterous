# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :track do
    title "Rails 4.0 (prime stack)"
    description "Learn how to develop cutting edge rails applications following TDD approach"
    creator factory: :user
  end
end
