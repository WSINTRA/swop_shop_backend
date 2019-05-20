class CustomerSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :posts
	has_many :replies
	has_many :customer_carts
	has_many :cart_items, :through => :customer_carts
end
