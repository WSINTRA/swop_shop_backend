class CartItemSerializer < ActiveModel::Serializer
  attributes :id, :customer, :product, :quantity
  belongs_to :customer
  belongs_to :product
end
