class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    shop = Shop.find(params[:shop_id])
    comment = current_user.comments.new(comment_params)
    comment.shop_id = shop.id
    if comment.save
      flash[:success] = "コメントしました"
      redirect_to shop_path(shop)
    else
      flash[:danger] = "コメントに失敗しました"
      redirect_to shop_path(shop)
    end
  end

  private

  def comment_params
  	params.require(:comment).permit(:content, :shop_id, :user_id)
  end
end