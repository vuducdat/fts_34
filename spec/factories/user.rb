FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password "123456789"
    password_confirmation {|user| user.password}

    factory :admin do
      role = 0
    end
  end
end
