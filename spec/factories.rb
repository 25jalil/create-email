FactoryGirl.define do
  factory :message do
    body "MyText"
    conversation nil
    user nil
  end
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
