class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts

  def update_post_likes_counter
    posts.update(likescounter: posts.likes.count)
  end
end
