FactoryBot.define do
  factory :employee do
    sequence(:email) { |n| "email#{n}@test.com" }
    password { 'password' }
  end
end
