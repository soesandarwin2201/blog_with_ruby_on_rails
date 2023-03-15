class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: 'author_id'
  has_many :like, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  validates :name, presence: true
  validates :postscounter, numericality: true, comparison: { greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  # def init
  #   return unless postscounter.nil?

  #   self.postscounter = 0
  # end
end
