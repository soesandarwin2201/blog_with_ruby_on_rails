class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes
  has_many :comments, dependent: :destroy

  def update_user_posts_counter
    user.update(postscounter: user.posts.count)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
