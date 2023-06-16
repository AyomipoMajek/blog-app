class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_counter, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_post_likes_counter

  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end
