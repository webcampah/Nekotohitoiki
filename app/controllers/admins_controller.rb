class AdminsController < ApplicationController
	before_action :authenticate_admin!
  def user_index
  	@users = User.page(params[:page]).per(20).order(created_at: :desc)
  end

  def shop_index
  	@shops = Shop.page(params[:page]).per(20).order(created_at: :desc)
  end
end
