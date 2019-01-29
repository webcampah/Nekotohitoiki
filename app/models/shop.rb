class Shop < ApplicationRecord
  attachment :shop_image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, source: :user

  validates :shop_name, presence: true, length: {maximum: 50}
  validates :address, presence: true, length: {maximum: 100}
  validates :shop_description, length: {maximum: 400}

  def favorite?(shop, user)
    shop.favorites.find_by(user_id: user.id)
  end
end
