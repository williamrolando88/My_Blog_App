class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable, :lockable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end
end
