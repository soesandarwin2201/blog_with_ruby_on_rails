class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  after_save :update_user_posts_counter

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  # private

  def update_user_posts_counter
    author.increment!(:postscounter)
  end
end
