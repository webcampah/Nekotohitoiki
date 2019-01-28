class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attachment :user_image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :shops, through: :favorites, source: :shop

  validates :name, presence: true, length: {in: 2..20}
  validates :email, presence: true, uniqueness: true, format: {with: VALID_EMAIL_REGEX}, length: {maximum: 50}
  validates :nickname, presence: true, length: {in: 2..20}
end
