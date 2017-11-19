10.times do
  Item.create(
    title: Faker::Commerce.product_name,
    inventory: Faker::Number.number(2),
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

george = User.create(email: "art@vandelay.com", password: "tippytoe")

# db:drop these last three for model tests to pass
# cart = Cart.create(user: george)
# cart.line_items.create(quantity: 3, item: Item.first)
# cart.line_items.create(quantity: 4, item: Item.second)
