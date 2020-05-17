class PlayquizzesController < ApplicationController
 layout 'playquiz'
 before_action :set_elements, only: %i(play_quiz result_quiz total_quiz)

  def play_quiz
    if params[:commit].blank?
       session[:result]= []
       session[:quiz_num] = 0
       session[:quizzes_id]= Quiz.all.pluck(:id).sample(5)
  	   @quiz = Quiz.find(session[:quizzes_id][session[:quiz_num]])
    else
       session[:quiz_num]+= 1
       @quiz = Quiz.find(session[:quizzes_id][session[:quiz_num]])
    end
    # if文でパラメーターがあるか確認する
    # なければクイズの配列を作成する
    # ある場合今何問目か確認してquiz_numの数字を+1する
  end

  def result_quiz
    @quiz = Quiz.find(session[:quizzes_id][session[:quiz_num]])
    if @quiz.answer == params[:choice]
      # 正解処理
      session[:result][session[:quiz_num]]= true
      @quiz.result = "正解!"
      @movie = @quiz.movie
    else
      # 不正解処理
      session[:result][session[:quiz_num]]= false
      @quiz.result = "不正解"
      @movie = @quiz.movie
    end

  end

  def total_quiz
    @quiz = Quiz.find(params[:id])
  end

  private
  	def set_elements
  	    @quizzes = Quiz.all
        @movies = Movie.all
  	end
  end
