
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?



  def is_clickbait?
    #binding.pry
    if /Won't Believe/.match(title) == nil
      errors.add(:title, "There was not a match")
    end
  end
end
