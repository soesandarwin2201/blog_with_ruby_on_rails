class Like < ApplicationRecord
 belongs_to :user, foreign_key: 'author_id'
 belongs_to :posts

 def update_post_likes_counter
    posts.update(likescounter: posts.likes.count)
  end
end