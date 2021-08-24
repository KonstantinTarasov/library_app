class User < ApplicationRecord
  validates :name, presence: true,
            length: {minimum: 2},
            uniqueness: true

  validates :email, presence: true,
            uniqueness: true

  has_many :books
end
