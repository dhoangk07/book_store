Publisher.all.delete_all
Category.all.delete_all
Book.all.delete_all

10.times do |n|
  name = Faker::FunnyName.name
  address = Faker::Address.full_address
  Publisher.create(name: name, address: address)
end

15.times do |n|
  name = Faker::Book.genre
  Category.create(name: name)
end


40.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  description = Faker::Lorem.paragraph(2)
  price = Faker::Number.decimal(2) 
  Category.all.each do |element|
        # debugger
    element.books.create!(title: title, author: author, description: description, price: price, publisher_id: Publisher.pluck(:id).sample)
  end
end
