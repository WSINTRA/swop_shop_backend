class CreateCustomerPostReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_post_replies do |t|
      t.references :customer, foreign_key: true
      t.references :post, foreign_key: true
      t.references :reply, foreign_key: true
      t.timestamps
    end
  end
end
