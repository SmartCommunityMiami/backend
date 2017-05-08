FactoryGirl.define do
  factory :department do
    name { FFaker::Company.name }
    email { FFaker::Internet.email }
    phone { FFaker::PhoneNumber.phone_number }
    organization { FFaker::Company.name }
  end
end
