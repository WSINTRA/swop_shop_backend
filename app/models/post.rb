class Post < ApplicationRecord
	belongs_to :customer
	has_many :customer_post_replies
	has_many :replies, :through => :customer_post_replies
	
end
