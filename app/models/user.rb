class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: {minimum: 2}, uniqueness: true

  has_many :books, dependent: :destroy
  has_many :comments

  before_validation :set_name, on: :create

  private

  def set_name
    self.name = "Пользователь библиотеки №#{rand(777)}" if self.name.blank?
  end
end
