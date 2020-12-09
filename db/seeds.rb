# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Cart.destroy_all
#CartOrder.destroy_all  #supprimer
Order.destroy_all
#OrderItem.destroy_all  #supprimer
Item.destroy_all
SubCategory.destroy_all
SubType.destroy_all
ItemCart.destroy_all
OrderUser.destroy_all
Admin.destroy_all



user_tmp = User.create(email: "arrvac@gmail.com", password: "password")
Admin.create(email: "admin@gmail.com", password: "password")
Cart.create(user: user_tmp)

SubCategory.create(duration: 3)
SubCategory.create(duration: 6)
SubCategory.create(duration: 9)
SubCategory.create(duration: 12)
SubType.create(specification: "Weekly")
SubType.create(specification: "Monthly")


SubCategory.all.each do |category|
    3.times do 
        item_tmp = Item.create(title: Faker::Lorem.sentence(word_count: 1), description: "Hebdomadaire hsdgjasdkajkhgfhsgFKHGASKJDFHGAKHFKJAHGSDK", price: 42, sub_category: category, sub_type: SubType.all.first, size: "350g", price_id: "price_1HvhPjLpDhDvbzmLGbrHK6FZ")
        item_tmp.avatar.attach(io: File.open('test/fixtures/files/500x500.jpeg'), filename: '500x500.jpeg')

        item_tmp = Item.create(title: Faker::Lorem.sentence(word_count: 1), description: "Mensuel hsdgjasdkajkhgfhsgFKHGASKJDFHGAKHFKJAHGSDK", price: 42, sub_category: category, sub_type: SubType.all.last, size: "350g", price_id: "price_1HvhPjLpDhDvbzmLGbrHK6FZ")
        item_tmp.avatar.attach(io: File.open('test/fixtures/files/500x500.jpeg'), filename: '500x500.jpeg')
    end
end



User.all.each do |user|
    3.times do
        item_tmp = Item.all.sample
        order_tmp = Order.create(item: item_tmp, start_date: DateTime.now, end_date: DateTime.now + 3.months)
        OrderUser.create(order: order_tmp, user: user)
        order_tmp = Order.create(item: item_tmp, start_date: Time.new(2018, 1, 1), end_date: Time.new(2018, 1, 1))
        OrderUser.create(order: order_tmp, user: user)
    end
    1.times do
        ItemCart.create(item: Item.all.sample, cart: user.cart)
    end
end



