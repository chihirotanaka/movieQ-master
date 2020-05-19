class Admins::MoviesController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin'

  def index
  	@newmovie = Movie.new
  	@movies = Movie.all
    @themes = Theme.all
    # .page(params[:page]).per(5)
  end

  def create
    @newmovie = Movie.new(movie_params)
    @movies = Movie.all
    @themes = Theme.all
    if @newmovie.save
       redirect_to  admins_movies_path, notice: "作品を登録しました!!"
    else
      render 'index'
    end
  end

  def edit
  	@movie =Movie.find(params[:id])
    @movies = Movie.all
    @themes = Theme.all
    @themes = Theme.all
  end

  def update
  	@movie =Movie.find(params[:id])
    if @movie.update(movie_params)
       redirect_to admins_movies_path, notice: "変更しました！"
    else
       render root_path
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
end
