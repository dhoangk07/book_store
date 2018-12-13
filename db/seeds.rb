Publisher.all.delete_all
Category.all.delete_all
Book.all.delete_all
Customer.all.delete_all
Editor.all.delete_all
Location.all.delete_all
User.all.delete_all
Review.all.delete_all
Comment.all.delete_all

20.times do |n|
  name = Faker::FunnyName.name
  address = Faker::Address.full_address
  Publisher.create(name: name, address: address)
end
puts 'Publisher seeded!'

25.times do |n|
  name = Faker::Book.genre
  Category.create(name: name)
end
puts 'Category seeded!'

40.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  description = Faker::Lorem.paragraph(2)
  price = Faker::Number.decimal(2) 
  Category.all.each do |element|
    element.books.create!(title: title, author: author, description: description, price: price, publisher_id: Publisher.pluck(:id).sample)
  end
end
puts 'Book seeded!'

20.times do |n|
  name = Faker::Name.name    
  sex = Faker::Gender.binary_type
  age = (20..40).to_a.sample
  Customer.create(name: name, sex: sex, age: age)
end
puts 'Customer seeded!'


20.times do |n|
  name = Faker::Name.name   
  phone = Faker::PhoneNumber.cell_phone
  birth_year = (1920..2000).to_a.sample
  Editor.create(name: name, phone: phone, birth_year: birth_year)
end
puts 'Editor seeded!'


20.times do |n|
  name = Faker::Address.city
  address = Faker::Address.street_address
  street = Faker::Address.street_name
  district = Faker::Address.state
  Location.create(name: name, address: address, district: district, street: street)
end
puts 'Location seeded!'

5.times do |n|
  name = Faker::Name.name    
  sex = Faker::Gender.binary_type
  age = (20..60).to_a.sample
  address = Faker::Address.street_address
  email = Faker::Internet.email
  password = '1234567'
  password_confirmation = '1234567'
  User.create(name: name, sex: sex, age: age, address: address, email: email, password: password, password_confirmation: password_confirmation)
end
puts 'User seeded!'

50.times do |n|
  content = Faker::Lorem.paragraph(10)
  Review.create(content: content, editor_id: Editor.pluck(:id).sample)
end
puts 'Review seeded!'

50.times do |n|
  content = Faker::Lorem.paragraph(30)
  Comment.create(content: content, book_id: Book.pluck(:id).sample)
end
puts 'Comment seeded!'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?