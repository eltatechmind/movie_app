class MoviesController < ApplicationController
  def index
    if params[:page].blank? 
      @genres = Tmdb::Movie.popular
    else
      @genres = Tmdb::Movie.popular(page: params[:page])
    end
  end

  def home
  end
  
  def search_results
    if params[:page].blank? && params[:name].blank?
      redirect_to trendingmovies_path
    elsif params[:page].blank?
      @searchedname = params[:name]
      @moviesnames = Tmdb::Search.movie(@searchedname)
    else
      @searchedname = params[:name]
      @moviesnames = Tmdb::Search.movie(@searchedname, page: params[:page])
    end
  end
end
