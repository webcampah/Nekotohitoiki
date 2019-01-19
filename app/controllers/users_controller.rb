class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "プロフィールを編集しました"
  		redirect_to user_path(@user.id)
  	else
  		render 'edit'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :name_kana, :email, :phone_number, :nickname, :user_description, :user_image)
  end
end
