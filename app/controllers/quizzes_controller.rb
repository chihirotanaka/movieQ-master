class QuizzesController < ApplicationController

# サイトtopページ(+about)
  def top
    @quiz = Quiz.find(Quiz.all.pluck(:id).sample(1))
  end

# ユーザークイズ作成ページ
  def new
    @newquiz = Quiz.new
    @movies = Movie.all
    @themes = Theme.all
    @movietheme = Movie.where(theme_id: params[:theme_id])
  end

  def create
    @newquiz = Quiz.new(post_quiz_params)
    @newquiz.user_id = current_user.id
    if @newquiz.save
    redirect_to user_home_path(current_user), notice: "作成しました！"
    else
    render 'back'
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
    else
       render root_path
    end
  end

  def destroy
       @quizzes = Quiz.find(params[:id])
    if @quizzes.destroy
       redirect_to user_home_path(current_user)
    else
      render 'back'
    end
  end

  private
  def post_quiz_params
    params.require(:quiz).permit(:user_id, :theme_id, :movie_id,
     :question, :emoji, :emoji2, :emoji3, :answer, :answer2, :answer3)
  end
end
