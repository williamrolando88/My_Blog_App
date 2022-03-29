class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  def comments_counter
    post_comments = Comment.where(post_id: post).count
    post.update(comments_counter: post_comments)
  end

  def get_author_name
    author.name
  end
end
