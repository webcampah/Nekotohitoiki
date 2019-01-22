class Shop < ApplicationRecord
  attachment :shop_image

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, source: :user
  belongs_to :prefecture

  validates :shop_name, presence: true, length: {maximum: 50}
  validates :address, presence: true, length: {maximum: 100}
  validates :shop_description, length: {maximum: 400}

  def fav_user(user_id)
  	Favorite.find_by(user_id: user_id)
  end
end
