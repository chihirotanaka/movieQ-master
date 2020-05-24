class QuizzesController < ApplicationController
  before_action :set_themes_movies, only: [:new, :create, :edit, :update]

# サイトtopページ(+about)
  def top
    @quiz = Quiz.find(Quiz.all.pluck(:id).sample(1))
  end

# ユーザークイズ作成ページ
  def new
    @newquiz = Quiz.new
    @movietheme = Movie.where(theme_id: params[:theme_id])
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def create
    @newquiz = Quiz.new(post_quiz_params)
    @newquiz.user_id = current_user.id
    if @newquiz.save
    redirect_to user_home_path(current_user)
    flash[:notice]= "作成しました！"
    else
    render new_quiz_path
    end
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    if @quiz.user_id == current_user.id
       @quiz.update(post_quiz_params)
       redirect_to user_home_path(current_user)
       flash[:notice]= "更新しました！"
    else
       render root_path
    end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    if @quiz.destroy
       redirect_to user_home_path(current_user)
       flash[:notice]= "削除しました！"
    else
      render 'back'
    end
  end

  private
  def post_quiz_params
    params.require(:quiz).permit(:user_id, :theme_id, :movie_id,
     :question, :emoji, :emoji2, :emoji3, :answer, :answer2, :answer3)
  end

  def set_themes_movies
    @themes =Theme.all
    @movies =Movie.all
  end
end
