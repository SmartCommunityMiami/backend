FactoryGirl.define do
  factory :vote do
  	report
  	user
  	direction [-1, 1].sample
  end
end