class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id

  def likes_counter
    post_likes = Like.where(post_id: post).count
    post.update(likes_counter: post_likes)
  end
end
