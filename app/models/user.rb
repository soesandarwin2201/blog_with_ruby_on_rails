class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  after_save :update_post_likes_counter

 private

 def update_post_likes_counter
  post.increment!(:likescounter)
 end
end
