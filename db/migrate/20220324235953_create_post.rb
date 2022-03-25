class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 40, null: false 
      t.text :text, null: false
      t.integer :comments_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
