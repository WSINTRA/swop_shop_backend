class CustomerCartSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :customer
  belongs_to :cart_item
end
