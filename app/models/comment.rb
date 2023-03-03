class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :posts
  has_many :likes

  after_save :update_post_comments_counter

  private

  def update_posts_comments_counter
    post.increment!(:commentscounter)
  end
end
