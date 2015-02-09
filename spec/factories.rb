FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person-#{n}@example.com" }
    password '123456'

    factory :user_with_ratings do
      transient do
        ratings_count 15
      end

      after(:create) do |user, evaluator|
        create_list(:rating, evaluator.ratings_count, user: user)
      end
    end
  end

  factory :restaurant do
    sequence(:name) { |n| "diner-#{n}" }
  end

  factory :rating do
    user
    restaurant
    last_visited { Date.today - rand(100) }
    rate { rand(1..5) }
  end
end