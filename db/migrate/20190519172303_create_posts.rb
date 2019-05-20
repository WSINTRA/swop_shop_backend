class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
        t.string :title
        t.string :content
        t.belongs_to :customer, index: true
      t.timestamps
    end
  end
end
