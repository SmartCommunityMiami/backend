FactoryGirl.define do
  factory :report do
    issue
    user
    description { FFaker::Lorem.sentence }
    picture_link { FFaker::Internet.http_url }
    latitude { rand() }
    longitude { rand() }
  end
end