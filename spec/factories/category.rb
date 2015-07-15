FactoryGirl.define do
  factory :category do
    name {Faker::Lorem.sentence}
    exetime 50
  end
end
