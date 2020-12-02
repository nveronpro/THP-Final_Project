# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Cart.destroy_all
CartOrder.destroy_all
Order.destroy_all
OrderItem.destroy_all
Item.destroy_all
SubCategory.destroy_all
SubType.destroy_all



user_tmp = User.create(email: "arrvac@gmail.con", password: "password")
cart_tmp = Cart.create(user: user_tmp)

SubCategory.create(duration: 3)
SubCategory.create(duration: 6)
SubCategory.create(duration: 9)
SubCategory.create(duration: 12)
SubType.create(specification: "Hebdomadaire")
SubType.create(specification: "Mensuel")


SubCategory.all.each do |category|
    3.times do 
        item_tmp = Item.create(title: Faker::Lorem.sentence(word_count: 1), description: "Hebdomadaire hsdgjasdkajkhgfhsgFKHGASKJDFHGAKHFKJAHGSDK", price: 42, sub_category: category, sub_type: SubType.all.first)
        item_tmp.avatar.attach(io: File.open('test/fixtures/files/500x500.jpeg'), filename: '500x500.jpeg')

        item_tmp = Item.create(title: Faker::Lorem.sentence(word_count: 1), description: "Mensuel hsdgjasdkajkhgfhsgFKHGASKJDFHGAKHFKJAHGSDK", price: 42, sub_category: category, sub_type: SubType.all.last)
        item_tmp.avatar.attach(io: File.open('test/fixtures/files/500x500.jpeg'), filename: '500x500.jpeg')
    end
end



3.times do
    order_tmp = Order.create()
    3.times do
        OrderItem.create(order: order_tmp, item: Item.all.sample)
    end
    CartOrder.create(cart: cart_tmp, order: order_tmp)
end



