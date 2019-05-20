class Customer < ApplicationRecord
	has_many :posts
	has_many :replies
	has_many :customer_carts
	has_many :cart_items, :through => :customer_carts
	has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end
