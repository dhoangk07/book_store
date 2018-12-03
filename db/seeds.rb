Publisher.all.delete_all
Category.all.delete_all
Book.all.delete_all
Customer.all.delete_all
Editor.all.delete_all
Location.all.delete_all

20.times do |n|
  name = Faker::FunnyName.name
  address = Faker::Address.full_address
  Publisher.create(name: name, address: address)
end

25.times do |n|
  name = Faker::Book.genre
  Category.create(name: name)
end


40.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  description = Faker::Lorem.paragraph(2)
  price = Faker::Number.decimal(2) 
  Category.all.each do |element|
    element.books.create!(title: title, author: author, description: description, price: price, publisher_id: Publisher.pluck(:id).sample)
  end
end

20.times do |n|
  name = Faker::Name.name    
  sex = Faker::Gender.binary_type
  age = (20..40).to_a.sample
  Customer.create(name: name, sex: sex, age: age)
end

20.times do |n|
  name = Faker::Name.name   
  phone = Faker::PhoneNumber.cell_phone
  birth_year = (1920..2000).to_a.sample
  Editor.create(name: name, phone: phone, birth_year: birth_year)
end

20.times do |n|
  name = Faker::Address.street_name
  address = Faker::Address.street_address
  district = Faker::Address.state
  Location.create(name: name, address: address, district: district)
end
