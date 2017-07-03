FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}.#{Faker::Internet.email}" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Internet.user_name }
    password 'password'
    #avatar
  end

  factory :category do
   sequence(:name) { |n| "Catégorie #{n}" }
  end

  factory :ingredient do
    name {Faker::Food.ingredient}
  end

  factory :meal do
    menu_name "Un super plat"
    portion 10
    availability 3.days.from_now
    price 4
    location "Los Angeles"
    category
    user
  end

  factory :review do
    rating 4
    comment {Faker::Lorem.sentence(3)}
    meal
    user
  end

  factory :order do
    message  {Faker::Lorem.sentence(3)}
    quantity 2
    meal
    payment false
  end

  factory :notification do
    read false
    content {Faker::Lorem.sentence(3)}
    user
  end
end
