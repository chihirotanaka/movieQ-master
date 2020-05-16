class UsersController < ApplicationController
  before_action :authenticate_user!

# ユーザークイズ一覧
  def home
    @quizzes = current_user.quizzes
    @users = User.all
  end

  def edit
  	@quiz = Quiz.find(params[:id])
  end

  def update
  	@user = curent_user.all
  	@user.update
  	redirect_to edit_user_path
  end

  def destroy
  	@user = curent_user.all
  	@user.delete
  	redirect_to root_path
  end
end
