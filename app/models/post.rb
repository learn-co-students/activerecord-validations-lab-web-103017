class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :non_clickbait

  def non_clickbait
    if !self.title.nil?
      if !["Won't Believe", "Secret", "Top", "Guess"].any? {|word| self.title.include?(word)}
        errors.add(:non_clickbait, "It's clickbait!")
      end
    end
  end

end
