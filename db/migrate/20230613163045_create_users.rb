class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.datetime :updated_at, null: false
      t.datetime :created_at, null: false
      t.integer :posts_counter
    end
    add_index :users, :name
  end
end
