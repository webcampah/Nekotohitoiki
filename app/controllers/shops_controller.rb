class ShopsController < ApplicationController
  def show
  	@shop = shop.find(params[:id])
  end

  def new
  	@shop = shop.new
  end

  def create
  	@shop = shop.new(shop_params)
  	if @shop.save
  		flash[:success] = '新規投稿が成功しました'
  		redirect_to shop_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@shop = shop.find(params[:id])
  end

  def update
  	@shop = shop.find(params[:id])
  	@shop.update(shop_params)
  	if @shop.save
  		flash[:success] = "編集しました"
  		redirect_to shop_path
  	else
  		render 'edit'
  	end
  end

  private

  def shop_params
  	params.require(:shop).permit(:shop_name, :shop_description, :shop_image)
end
