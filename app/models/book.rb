class Book < ApplicationRecord
  validates :title, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :year, presence: true
  validates :author, presence: true

  belongs_to :user
end
