class CustomerCart < ApplicationRecord
	belongs_to :customer
	belongs_to :cart_item
end
