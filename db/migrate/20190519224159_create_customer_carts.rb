class CreateCustomerCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_carts do |t|
      t.references :customer, foreign_key: true
      t.references :cart_item, foreign_key: true
      t.timestamps
    end
  end
end
