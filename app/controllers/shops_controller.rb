class ShopsController < ApplicationController
  before_action :authenticate_user!,  only: [:create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]

  def show
  	@shop = Shop.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(shop_id: params[:id]).page(params[:page]).per(10).order(created_at: 'desc')
  end

  def new
  	@shop = Shop.new
  end

  def create
  	@shop = Shop.new(shop_params)
  	if @shop.save
  		flash[:success] = "新規投稿が成功しました"
  		redirect_to shop_path(@shop.id)
  	else
      flash[:danger] = "入力内容の確認をお願いします"
  		render 'new'
  	end
  end

  def edit
  	@shop = Shop.find(params[:id])
  end

  def update
  	@shop = Shop.find(params[:id])
  	@shop.update(shop_params)
  	if @shop.save
  		flash[:success] = "編集しました"
  		redirect_to shop_path(@shop)
  	else
      flash[:danger] = "編集内容の確認をお願いします"
  		render 'edit'
  	end
  end

  def index
    if params[:category] && params[:prefecture]
      @shops = Shop.where(prefecture: (params[:prefecture])).where(category: (params[:category])).page(params[:page]).per(20)
    else
      @shops = Shop.where(prefecture: (params[:prefecture])).page(params[:page]).per(20)
    end
  end

  def destroy
    @shop =  Shop.find(params[:id])
    if @shop.destroy
      flash[:success] = "削除しました"
      redirect_to admins_shop_index_path
    else
      flash[:danger] = "削除失敗しました"
      redirect_to admins_shop_index_path
    end
  end

  private

  def shop_params
  	params.require(:shop).permit(:shop_name, :shop_description, :shop_image, :prefecture, :address, :shop_url, :category)
  end
end
