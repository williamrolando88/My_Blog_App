class AddRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :user, null: false, foreign_key: true, on_delete: :cascade
    add_reference :likes, :post, null: false, foreign_key: true, on_delete: :cascade
    rename_column :likes, :user_id, :author_id
  end
end
