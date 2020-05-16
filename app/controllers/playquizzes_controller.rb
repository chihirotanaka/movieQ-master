class PlayquizzesController < ApplicationController
 layout 'playquiz'
 before_action :set_elements, only: %i(play_quiz result_quiz total_quiz) 

  def play_quiz
  	@quiz = Quiz.find(params[:id])
  end

  def result_quiz
  	@answer = Quiz.find(params[:answer][:movie_id])
  	
  end

  def total_quiz
  	
  end

  private
  	def set_elements
  	    @quizzes = Quiz.all
        @movies = Movie.all
  	end
  end
