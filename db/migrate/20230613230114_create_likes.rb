class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
    add_index :likes, :user_id
    add_index :likes, :post_id
  end
end
