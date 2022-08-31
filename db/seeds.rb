10.times do  |i|
    property = Property.create!(
      name: Faker::Lorem.word,
      headline: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      address_1: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: "United States",
      latitude: 0, 
      longitude: 0,
      price: Money.from_amount((25..100).to_a.sample)
      
    )

    property.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "property_#{i + 1}.png")), filename: property.name)
end
  
5.times do  |i|
  admins = Admin.create!(
    email: Faker::Internet.email,
    password: "123456"
  )
  partner = Partner.create!(
    email: Faker::Internet.email,
    password: "123456"
  )

  user = User.create!(
    email: Faker::Internet.email,
    password: "123456"
  )

  favorite = Favorite.create!(
    user_id: Faker::Number.between(from: 1, to: 5),
    property_id: Faker::Number.between(from: 1, to: 10)
  )

end


puts "Seed finished"
puts "#{Property.count} properties created"
puts "#{Admin.count} Admins created"
puts "#{Partner.count} Partners created"
puts "#{User.count} Users created"
puts "#{Favorite.count} Favorites created"