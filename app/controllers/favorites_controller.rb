class FavoritesController < ApplicationController
	before_action :set_shop, except: :index
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
  	@favorite = Favorite.create(user_id: current_user.id, shop_id: params[:shop_id])
  	@favorites = Favorite.where(shop_id: params[:shop_id])
  	@shop.reload
  end

  def destroy
  	favorite = Favorite.find_by(user_id: current_user.id, shop_id: params[:shop_id])
  	favorite.destroy
  	@favorites = Favorite.where(shop_id: params[:shop_id])
  	@shop.reload
  end

  def index
    @user = current_user
  	@favorites = Favorite.where(user_id: @user.id).all
  end

  private

  def set_shop
  	@shop = Shop.find(params[:shop_id])
  end
end
