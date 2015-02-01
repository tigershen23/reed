FactoryGirl.define do
  factory :book do
    association :reader
    title { Faker::Company.name }
    author { Faker::Name.name }
    description { Faker::Lorem.sentence }
    amazon_id { Faker::Bitcoin.address }
    rating { rand(5) + 1 }
    keywords { [title, author, description].map(&:downcase).join(' ') }

    trait :finished do
      finished_on { 1.day.ago }
    end
  end

  factory :genre do
    name { Faker::Company.name }
  end

  factory :reader do
    id { rand(10000) }
  end
end


