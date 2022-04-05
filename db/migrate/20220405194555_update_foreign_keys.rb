class UpdateForeignKeys < ActiveRecord::Migration[7.0]
  def change
    def change
    # remove the old foreign_key
    remove_foreign_key :likes, :posts
    remove_foreign_key :comments, :posts

    # add the new foreign_key
    add_foreign_key :likes, :posts, on_delete: :cascade
    add_foreign_key :comments, :posts, on_delete: :cascade
    end
  end
end
