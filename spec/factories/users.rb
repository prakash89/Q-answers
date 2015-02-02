FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }
  factory :user do
    email
    password "12345678"
  end

end
