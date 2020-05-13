class Admins::MoviesController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@newmovie = Movie.new
  	@movies = Movie.all
    @themes = Theme.all
  end

  def create
    @newmovie = Movie.new(movie_params)
    @movies = Movie.all
    @themes = Theme.all
    if @newmovie.save
       redirect_to  admins_movies_path
       flash[:notice] = "作品を登録しました!!"
    else
      render 'index'
    end
  end

  def edit
  	@movie =Movie.find(params[:id])
  end

  def update
  	@movie =Movie.find(params[:id])
  end

  def destroy
    movie =Movie.find(params[:id])
    movie.destroy
    redirect_to admins_movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :column, :year, :theme_title, :image)
  end
end
