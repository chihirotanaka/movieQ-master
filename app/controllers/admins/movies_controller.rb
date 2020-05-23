class Admins::MoviesController < ApplicationController
  before_action :set_themes_movies, only: [:create, :edit, :update]
  before_action :authenticate_admin!

  layout 'admin'

  def index
  	@newmovie = Movie.new
    @themes = Theme.all
    @movies = Movie.page(params[:page]).per(5)
    @admins_movies = Movie.page(params[:page]).per(5)
  end

  def create
    @newmovie = Movie.new(movie_params)
    if @newmovie.save
       redirect_to  admins_movies_path
       flash[:notice]= "作品を登録しました!!"
    else
      render 'index'
    end
  end

  def edit
  	@movie =Movie.find(params[:id])
  end

  def update
  	@movie =Movie.find(params[:id])
    if @movie.update(movie_params)
       redirect_to admins_movies_path
       flash[:notice]= "更新しました！"
    else
       render admins_movies_path
    end
  end

  def destroy
    movie =Movie.find(params[:id])
    movie.destroy
    redirect_to admins_movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:theme_id, :title, :column, :year, :image)
  end

  def set_themes_movies
    @themes =Theme.all
    @movies =Movie.all
  end
end
