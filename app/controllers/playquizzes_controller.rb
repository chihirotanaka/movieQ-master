class PlayquizzesController < ApplicationController
 layout 'playquiz'
 before_action :set_elements, only: %i(play_quiz result_quiz total_quiz) 

  def play_quiz
 
 
  end

  def result_quiz
  	
  end

  def total_quiz
  	
  end

  private
  	def set_elements
  	    @quizzes = Quiz.all
        @movies = Movie.all
  	end
  end
