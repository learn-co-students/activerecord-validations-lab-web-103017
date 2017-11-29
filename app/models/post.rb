class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length:{minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?


  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end

  # def check_if_clickbait
  #   words = [ "Won't Believe", "Secret", "Top
  #           [number]", "Guess" ]
  #   words.none? { |word|  }
  #       errors.add(:title, "must be clickbait")
  #   end
  # end


end
