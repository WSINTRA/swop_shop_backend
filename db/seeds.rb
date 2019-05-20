# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Customer.destroy_all
# Product.destroy_all
# Post.destroy_all
# Reply.destroy_all
# CustomerPostReply.destroy_all
# Cart.destroy_all
# # CustomerCart.destroy_all

will = Customer.create(username: "Will", email:"will@test.com", password:"testp455")
headphones = Product.create(name:"Sony Headphones", quantity:10, price:24.99, description:"Black headphones with noise cancellation")
iphone = Product.create(name:"Iphone5s", quantity:10, price:24.99, description:"Black Apple Iphone 5s")
testpost = Post.create(title:"title", content:"some content to start with",customer_id:will.id)
testReply = Reply.create(content:"This is a test reply", customer_id:will.id)
cusPosReply = CustomerPostReply.create(customer_id:will.id, post_id:testpost.id, reply_id:testReply.id)
firstitemInCart = CartItem.create(customer_id:will.id, product_id:headphones.id )
secondItem = CartItem.create(customer_id:will.id, product_id:iphone.id )
customerCart = CustomerCart.create(customer_id:will.id, cart_item_id:firstitemInCart.id)
AddtoCart = CustomerCart.create(customer_id:will.id, cart_item_id:secondItem.id)
