class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
  validates :summary, length: { maximum: 20 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :click_bait


  def click_bait
      if !(self.title =~ (/Won't Believe|Secret|Top \d|Guess/))
        self.errors[:base] << "Not click-bait-y enough"
      end
    end
end
# t.string :title
# t.text :content
# t.text :summary
# t.string :category
