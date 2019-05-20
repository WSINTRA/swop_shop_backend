class ReplySerializer < ActiveModel::Serializer
  has_many :customer_post_replies
	has_many :customers, :through => :customer_post_replies
	has_many :posts, :through => :customer_post_replies

  attributes :id, :content
end
