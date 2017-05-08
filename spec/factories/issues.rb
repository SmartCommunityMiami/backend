FactoryGirl.define do
  factory :issue do
    description { FFaker::Lorem.sentence }
    department
  end
end
