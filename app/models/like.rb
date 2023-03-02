class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts

  after_save :update_post_likes_counter

private

def update_post_likes_counter
  post.increment!(:likescounter)
end
end
