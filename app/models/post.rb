class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  def recent_five_posts
    comments.last(5)
  end

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
