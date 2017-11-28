class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :click_bait

  def click_bait
    if !(self.title =~ (/Won't Believe|Secret|Top \d|Guess/))
      self.errors[:base] << "Not click-bait-y enough"
    end
  end

end
