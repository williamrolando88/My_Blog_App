class AddRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true, on_delete: :cascade
    add_reference :comments, :post, null: false, foreign_key: true, on_delete: :cascade
    rename_column :comments, :user_id, :author_id
  end
end
