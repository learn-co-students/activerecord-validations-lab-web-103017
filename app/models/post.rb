class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

  validate :click_bait

  def click_bait
    #binding.pry
    if self.title
    unless self.title.match(/Won't Believe|Secret|Top \d|Guess/)
      errors.add(:title, "must be click-baity")
    end
  end

  end
end
