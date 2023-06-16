class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments, class_name: 'Comment', foreign_key: :post_id
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    comments.last(5)
  end
end
