class CustomerPostReply < ApplicationRecord
	belongs_to :customer
	belongs_to :reply
	belongs_to :post
end
