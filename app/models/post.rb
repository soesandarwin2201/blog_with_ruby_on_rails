class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments, dependent: :destroy

  after_save :update_user_posts_counter

  private

  def update_user_posts_counter
  author.increment!(:postscounter)
  end


  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
