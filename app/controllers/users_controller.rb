class UsersController < ApplicationController
  before_action :authenticate_user!

  def home
  	@quizzes = current_user.quizzes.all
  end

  def edit
  	@user = curent_user.all
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
