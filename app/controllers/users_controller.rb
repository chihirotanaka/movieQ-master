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
  	   @user.update
  	   redirect_to edit_user_path(current_user)
    else
       render 'root_path'
    end
  end

  def destroy
  	@user = current_user
  	@user.destroy
  	redirect_to root_path
  end
end
