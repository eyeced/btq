FactoryGirl.define do 
  factory :user do
    name "Foobar"
    sequence(:email) { |n| "foo#{n}@example.com" }
    password "secret"
    password_confirmation "secret"
    confirmed_at Time.now
  end
end
