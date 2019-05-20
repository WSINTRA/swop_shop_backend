class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
        t.string :content
        t.belongs_to :customer, index: true
      t.timestamps
    end
  end
end
