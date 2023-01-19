class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_five_posts
    comments.last(5)
  end

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end