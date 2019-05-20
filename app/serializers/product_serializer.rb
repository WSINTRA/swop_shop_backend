class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :quantity, :price, :image_url
  has_many :cart_items
end
