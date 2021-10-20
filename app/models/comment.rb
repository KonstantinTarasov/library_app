class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :book, presence: true
  validates :body, presence: true

  validates :user_name, presence: true, unless: 'user.present?'

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

end
