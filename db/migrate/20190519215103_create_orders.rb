class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :customer, index: true
      t.integer :order_total
      t.string :order_details
      t.timestamp :order_date
      t.timestamps
    end
  end
end
