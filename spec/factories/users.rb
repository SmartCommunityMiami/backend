FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    username { FFaker::Internet.user_name }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }

    password "12345678"
    password_confirmation "12345678"
  end
end