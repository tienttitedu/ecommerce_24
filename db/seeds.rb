User.create!(name: "Admin",
  email: "admin@gmail.com",
  address: "abc",
  password: "123456",
  password_confirmation: "123456",
  role: 1)

(1..10).each do |stt|
  User.create(
    name: "tientt#{stt}",
    email: "tientt#{stt}@gmail.com",
    address: "DaNang #{stt}",
    password: "123456",
    password_confirmation: "123456"
    )
end

Category.create(name: "Phim", description: "phim", parent_id: nil)
Category.create(name: "DVD", description: "dvd", parent_id: nil)
Category.create(name: "Media", description: "media", parent_id: nil)
Category.create(name: "Phim HD", description: "phim", parent_id: 1)
Category.create(name: "Phim ma", description: "phim", parent_id: 1)
Category.create(name: "DVD hai", description: "dvd", parent_id: 2)
Category.create(name: "Chientranh", description: "media", parent_id: 3)
Category.create(name: "LichSu", description: "media", parent_id: 3)
Category.create(name: "WorldWar", description: "chientranh", parent_id: 7)
Category.create(name: "Berlin", description: "worldwar", parent_id: 9)
(1..11).each do |stt|
  Product.create(
    name: "Phim #{stt}",
    description: "good products, affordable prices, excellent quality,
      perfect on both, best buy for all",
    price: (100 * stt),
    quantity: (10 + stt),
    category_id: 4
    )
end

(1..11).each do |stt|
    Product.create(
    name: "DVD #{stt}",
    description: "good products, affordable prices, excellent quality,
      perfect on both, best buy for all",
    price: (100 * stt),
    quantity: (10 + stt),
    category_id: 6
    )
end
