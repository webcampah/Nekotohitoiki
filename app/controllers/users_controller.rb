class UsersController < ApplicationController
  before_action :authenticate_user!,  only: [:edit, :update]
  before_action :authenticate_admin!, only: [:destroy]

  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:success] = "プロフィールを編集しました"
  		redirect_to user_path(@user)
  	else
      flash[:danger] = "入力内容の確認をお願いします。"
  		render 'edit'
  	end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "削除しました"
      redirect_to admins_user_index_path
    else
      flash[:danger] = "削除失敗しました"
      redirect_to admins_user_index_path
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :phone_number, :nickname, :user_description, :user_image)
  end
end
