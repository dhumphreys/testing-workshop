FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password 'password'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role 'user'

    trait :admin do
      role 'admin'
    end

    trait :john_doe do
      first_name 'John'
      last_name 'Doe'
    end

    trait :no_name do
      first_name nil
      last_name nil
    end

    trait :no_role do
      role nil
    end
  end
end
