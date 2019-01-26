class CommentsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    comment = current_user.comments.new(comment_params)
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop)
  end

  def destroy
    shop = Shop.find(params[:shop_id])
  	comment = shop.comments.find(params[:id])
    comment.destroy
  	redirect_to shop_path(shop)
  end

  private

  def comment_params
  	params.require(:comment).permit(:content, :shop_id, :user_id)
  end
end