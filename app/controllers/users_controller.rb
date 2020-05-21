class UsersController < ApplicationController
  before_action :authenticate_user!

# ユーザークイズ一覧
  def home
    @quizzes = current_user.quizzes
    @users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user == current_user
  	   @user.update(user_params)
  	   redirect_to edit_user_path(@user), notice: "変更できました！"
    else
       render 'root_path'
    end
  end

  def destroy
    @user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
  end
end
