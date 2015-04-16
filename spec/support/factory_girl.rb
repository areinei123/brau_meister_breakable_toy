require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

end

FactoryGirl.define do
  factory :recipe do
    name 'New Stout'
    batch_size '5'
  end
end
