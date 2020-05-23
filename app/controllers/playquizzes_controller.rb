class PlayquizzesController < ApplicationController
 layout 'playquiz'
 before_action :set_elements, only: %i(play_quiz result_quiz total_quiz)

  def play_quiz

    if params[:commit].blank?
       session[:result]= []
       session[:quiz_num] = 0
       session[:quizzes_id]= Quiz.all.pluck(:id).sample(5)
    else
       session[:quiz_num]+= 1
    end
    if session[:quizzes_id].size > session[:quiz_num]
      @quiz = Quiz.find(session[:quizzes_id][session[:quiz_num]])
    else
      @quiz = Quiz.all.shuffle.take(1)
    end
    @options = [@quiz.answer,@quiz.answer2,@quiz.answer3].shuffle
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
      @quiz.result = "不正解.."
      @movie = @quiz.movie
    end
  end

  def total_quiz
    @quizzes = Quiz.where(id: session[:quizzes_id])
  end

  private
  	def set_elements
  	    @quizzes = Quiz.all
        @movies = Movie.all
  	end
  end
