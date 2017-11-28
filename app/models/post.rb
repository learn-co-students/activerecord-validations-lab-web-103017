class Post < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if !(self.title =~ (/Won't Believe|Secret|Top \d|Guess/))
        self.errors[:base] << "Not click-bait-y enough"
    end
  end
end
