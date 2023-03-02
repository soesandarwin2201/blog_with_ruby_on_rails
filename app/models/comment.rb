class Comment < ApplicationRecord
 belongs_to :user , foreign_key: 'author_id'
 belongs_to :posts
 has_many :likes

def update_post_comments_counter
    posts.update(commentscounter: posts.comments.count)
  end
end