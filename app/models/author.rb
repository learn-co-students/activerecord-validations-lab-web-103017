class Author < ActiveRecord::Base
  validates :name, length: { minimum: 1 }
  validates :phone_number, length: { minimum: 10 }
  validates :name, uniqueness: true
end
