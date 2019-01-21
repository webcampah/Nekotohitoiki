class CommentsController < ApplicationController
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
    	render :index
    end

  def destroy
  	@comment = Comment.find(params[:id])
  	if @comment.destroy
  		render :index
  	end
  end

  private

  def comment_params
  	params.require(:comment).permit(:comment_content, :place_id, :user_id)
  end
end