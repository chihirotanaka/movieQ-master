class QuizzesController < ApplicationController
before_action :set_quiz, only: [:quiz, :result, :total]

# サイトtopページ(aboutを兼務)
  def index
  end

# クイズ制作ページ
  def new
    @newquiz = Quiz.new
    @movies = Movie.all
    @themes = Theme.all
    @movietheme = Movie.where(theme_id: params[:theme_id])
    # @Themes = Movie.theme.theme
  end

  def create
    @newquiz = Quiz.new(post_quiz_params)
    @newquiz.user_id = current_user.id
    if @newquiz.save
    redirect_to user_home_path(current_user)
    else
    render 'back'
    end
  end

  def edit
    @quizzes = movie.quizzes.all
  end

  def update
    @quiz.update
  end

  def destroy
    @quizzes = Quiz.find(params)
    if @quiz
    @quiz.destroy
    redirect_to user_home_path(current_user)
  end

# クイズ画面
  def quiz
  end

  def result
  end

  def total
  end

  private
  def post_quiz_params
    params.require(:quiz).permit(:user_id, :theme_id, :movie_id,
     :question, :emoji, :emoji2, :emoji3, :answer, :answer2, :answer3)
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
end
