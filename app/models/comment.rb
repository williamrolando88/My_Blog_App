class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  def comments_counter
    post.increment!(:comments_counter)
  end

  def author_name
    author.name
  end
end
