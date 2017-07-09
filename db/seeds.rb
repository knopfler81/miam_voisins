Category.create(name: "Halal")
Category.create(name: "Casher")
Category.create(name: "Vegan")
Category.create(name: "Végétarien")
Category.create(name: "Gros porc")
Category.create(name: "Indien")
Category.create(name: "Italien")


puts "Creating users"

10.times do
  print "."
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar_url: ['http://lorempixel.com/output/people-q-c-640-480-9.jpg', 'http://lorempixel.com/output/people-q-c-640-480-8.jpg', 'http://lorempixel.com/output/people-q-c-640-480-7.jpg', 'http://lorempixel.com/output/people-q-c-640-480-6.jpg'].sample,
    nickname: Faker::Pokemon.name
  )
  user.save!
end

puts "Creating Coming Meals"

20.times  do
  print "."
  upcoming_meal = Meal.create(
    menu_name: ["Pizza", "Burger", "Salade de granny", "Soupe"].sample,
    portion: 20,
    price: 4,
    availability: 2.day.from_now,
    user_id: User.pluck(:id).sample,
    location: ["Lyon", "Saint Etienne"].sample,
    category_id: Category.pluck(:id).sample,
    image_urls: ['http://lorempixel.com/output/food-q-c-640-480-2.jpg', 'http://lorempixel.com/output/food-q-c-640-480-3.jpg', 'http://lorempixel.com/output/food-q-c-640-480-4.jpg'],
    )
    upcoming_meal.save!

    Ingredient.create(name: "ingredient_1", meal_id: Meal.pluck(:id).sample,)

    Ingredient.create(name: "ingredient_2", meal_id: Meal.pluck(:id).sample,)

    Ingredient.create(name: "ingredient_3", meal_id: Meal.pluck(:id).sample,)

end

puts "Creating passed Meals"

10.times  do
  print "."
  passed_meal = Meal.create(
    menu_name: ["Pizza", "Burger", "Salade de granny", "Soupe"].sample,
    portion: 20,
    price: 4,
    availability: 2.day.ago,
    user_id: User.pluck(:id).sample,
    location: ["Lyon", "Saint Etienne"].sample,
    category_id: Category.pluck(:id).sample,
    image_urls: ['http://lorempixel.com/output/food-q-c-640-480-2.jpg', 'http://lorempixel.com/output/food-q-c-640-480-3.jpg', 'http://lorempixel.com/output/food-q-c-640-480-4.jpg'],
    )
    passed_meal.save!
    Ingredient.create(name: "ingredient_1", meal_id: Meal.pluck(:id).sample,)

    Ingredient.create(name: "ingredient_2", meal_id: Meal.pluck(:id).sample,)

    Ingredient.create(name: "ingredient_3", meal_id: Meal.pluck(:id).sample,)

end

puts "Creating Orders"

5.times do
  print "."
  meal_id = Meal.pluck(:id).sample
  quantity = (1..3).to_a.sample
  order = Order.new(
    quantity: quantity,
    amount: Meal.find_by_id(meal_id).price * quantity,
    user_id: User.pluck(:id).sample,
    meal_id: meal_id,
    payment_status: true
    )

  order.save!
end

puts "Creating old Orders"

5.times do
  print "."
  old_meal = Meal.last(3).sample
  quantity = (1..3).to_a.sample
  order = Order.new(
    quantity: quantity,
    amount: old_meal.price * quantity,
    user_id: User.pluck(:id).sample,
    meal_id: old_meal.id,
    payment_status: true
    )

  order.save!
end

puts "Creating Reviews"

5.times do
  print "."
  review = Review.new(
    comment: Faker::Lorem.paragraph(2),
    rating: (1..5).to_a.sample,
    user_id: User.pluck(:id).sample,
    meal_id:Meal.pluck(:id).sample,
    )
  review.save!
end

