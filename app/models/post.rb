class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  def update_post_counter
    author_posts = Post.where(author_id: author).count
    author.update(posts_counter: author_posts)
  end
end
