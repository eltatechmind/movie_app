class MoviesController < ApplicationController
  def index
    if params[:page].blank? 
      @allmovies = Tmdb::Movie.popular
    else
      @allmovies = Tmdb::Movie.popular(page: params[:page])
    end
  end

  def home
  end

  def movie_details
    if params[:id].blank?
      redirect_to root_path
    else
      @details = Tmdb::Movie.detail(params[:id])
      redirect_to root_path if @details.nil?
      @casts = Tmdb::Movie.cast(params[:id])
    end
  end

  def search_results
    if params[:page].blank? && params[:name].blank?
      redirect_to root_path
    elsif params[:page].blank?
      @searchedname = params[:name]
      @moviesnames = Tmdb::Search.movie(@searchedname)
    else
      @searchedname = params[:name]
      @moviesnames = Tmdb::Search.movie(@searchedname, page: params[:page])
    end
  end
end
